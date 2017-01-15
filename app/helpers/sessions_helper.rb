module SessionsHelper
  #一旦账号密码正确，则成功登录，同时在session中记录session[:user_id]
  def log_in(user)
    session[:user_id] = user.id
  end
  #如果用户允许在本地保存登录信息，则保存cookies
  def remeber(user)
    #先把本次登录的remeber_token保存至数据库
    user.remeber
    #然后把remeber_token保存到cookies中，同时把user_id也保存在cookies中
    # cookies[:remeber_token] = { value: user.remeber_token, expires: 10.days.from_now.utc}
    # cookies.signed[:user_id] = { value: user.id, expires: 10.days.from_now.utc}
    cookies.permanent[:remeber_token] = user.remeber_token
    cookies.permanent.signed[:user_id] = user.id
  end
  #获取当前登录用户，如未登录，则为nil.@current_user这个实例变量是为了避免每次调用current_user方法都去查询一遍数据库的情况。
  def current_user
    #先判断session中是否为nil
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
      #再判断cookies中是否保存了登录信息
    else (user_id = cookies.signed[:user_id])
    user = User.find_by(id: user_id)
    #如果cookies中保存了，再用authenticated?这个方法判断cookies[:remeber_token]或者数据库中的remeber_digest是否一致。
    if user && user.authenticated?(cookies[:remeber_token])
      log_in(user)
      @current_user = user
    end
    end
  end
  #用来判断用户是否登录的方法
  def logged_in?
    !current_user.nil?
  end
  #用来清空持久性登录信息
  def forget(user)
    user.forget #将user.remeber_digest重置为nil
    #删除cookies中的登录信息
    cookies.delete(:user_id)
    cookies.delete(:remeber_token)
  end
  #退出，同时删除session中的信息
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
end
