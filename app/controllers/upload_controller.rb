require 'net/http'
require 'openssl'
require 'rubygems'
require 'json'
require 'pp'
require 'qiniu'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
class UploadController < ApplicationController

  def upload
    @picture = Picture.new(upload_params)
    puts 'upload param:'
    puts upload_params
    puts 'picture url before save'
    puts @picture.url
    @picture.save
    puts 'picture url after save'
    puts @picture.url

    puts 'start upload to qiniu'
    # 构建鉴权对象
    Qiniu.establish_connection! :access_key => 'EC5CXXt_VoJLLhhhkYxytmxkUgQjVkQJS02VJ2Ps',
                                :secret_key => 'tg-8oimJfefn6mP4pW9bCTdBlwB77YzWUWWDiIfH'

    #要上传的空间
    bucket = 'imagemaster'

    # 上传到七牛后保存的文件名
    key=nil

    # 构建上传策略，上传策略的更多参数请参照 http://developer.qiniu.com/article/developer/security/put-policy.html
    put_policy = Qiniu::Auth::PutPolicy.new(
        bucket, # 存储空间
        key,    # 指定上传的资源名，如果传入 nil，就表示不指定资源名，将使用默认的资源名
        3600    # token 过期时间，默认为 3600 秒，即 1 小时
    )

    # 生成上传 Token
    uptoken = Qiniu::Auth.generate_uptoken(put_policy)

    pic_url=@picture.url
    # 要上传文件的本地路径
    filePath = "./public#{pic_url}"
    puts filePath
    # 调用 upload_with_token_2 方法上传
    code, result, response_headers = Qiniu::Storage.upload_with_token_2(
        uptoken,
        filePath,
        key,
        nil, # 可以接受一个 Hash 作为自定义变量，请参照 http://developer.qiniu.com/article/kodo/kodo-developer/up/vars.html#xvar
        bucket: bucket
    )

    #打印上传返回的信息
    puts 'code:'
    puts code
    puts 'result'
    puts result
    pic_url= 'http://oixe57o8h.bkt.clouddn.com/'+result['hash']
    puts pic_url
    uri = URI('https://api.projectoxford.ai/vision/v1.0/analyze')
    uri.query = URI.encode_www_form({
                                        # Request parameters
                                        'visualFeatures' => 'Tags',
                                        'language' => 'en'
                                    })

    request = Net::HTTP::Post.new(uri.request_uri)

    # Request headers
    request['Content-Type'] = 'application/json'
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = '29319fbc62ae42699b82fb25ea255882'
    # Request body
    request.body = "{\"url\":\"#{pic_url}\"}"
    puts "body"
    puts request.body
    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      http.request(request)
    end
    puts response.body
    parsed_json = JSON(response.body)
    tag_str=''
   # p1 = Picture.create({url: @picture.url})
    tag_arr = Array.new
    for tag in parsed_json['tags']
      #tag_str+=tag['name']+',
      tag_obj = Tag.find_by(name: tag['name'])
      if !tag_obj
        puts "==============="
        puts 'tag is null'
        tag_obj = Tag.create({name: tag['name']})

      end
      tag_arr<< tag_obj


    end
    @picture.tags =tag_arr
    puts 'after upload ro qiniu'
    puts @picture.url
    redirect_to '/users/1'
    #@tag = Tag.find_by(name: upload_params[:tag])
    #if !@tag
     # redirect_to '/welcome/none'
    #else
    # @pictures = @tag.pictures
    #  render "tags/show"
    #end

  end

  # 这个方法允许在动作中使用 name 属性
  def upload_params
    params.require(:uploadpicture).permit(:url, :url_cache, :tag)
  end


end
