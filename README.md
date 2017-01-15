# ImageMaster

本项目已部署在heroku平台上: [ImageMaster](https://agile-image-master.herokuapp.com/)


## 截图


<img src="/screenshots/01-home-page.png" width="700">  

* 用户可根据关键字搜索图片

<img src="/screenshots/10-search.png" width="700">

* 用户可上传自己的图片

<img src="/screenshots/07-upload.png" width="300"> 

* 用户可分析图片，获得一段图片的描述

<img src="/screenshots/09-result.png" width="500"> 

## 说明

使用的库与数据库

* 使用[Bootstrap](http://getbootstrap.com/)作为前端库
* 开发环境使用[sqlite3](https://www.sqlite.org/)作为数据库
* 运行环境使用[Postgresql](http://postgresapp.com/)作为数据库
* 使用[qiniu](http://www.qiniu.com/)作为图片存储平台

## 使用

* 图片搜索功能不需登陆就可以使用
* 图片上传及分析要求用户先注册登陆
* 测试用户名：milly  密码：123456789

## 测试

###cucumber
```
运行准备：
rails generate cucumber:install capybara
rails generate cucumber_rails_training_wheels:install
rails generate rspec:install
rake db:test:prepare
运行：
cucumber (全部执行)
cucumber features/XX.feature (执行XX测试，.feature文件在features文件夹下)
```
## Future Work

1. 完善用户界面
2. 添加用户权限
3. 图片批量上传
4. 模糊搜索
