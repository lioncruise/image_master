# ImageMaster [![Build Status](https://travis-ci.org/lioncruise/image_master.svg?branch=master)](https://travis-ci.org/lioncruise/image_master)

This project has been deployed on Heroku cloud platform [ImageMaster](https://agile-image-master.herokuapp.com/)

GitHub url：[ImageMaster](https://github.com/lioncruise/image_master)


## Functions

<img src="/screenshots/01-home-page.png" width="700">  

* User can search pictures via keywords

<img src="/screenshots/10-search.png" width="700">

* User can upload their pictures on the cloud storage

<img src="/screenshots/07-upload.png" width="300"> 

* User can analyze the picture and get a description of the picture

<img src="/screenshots/09-result.png" width="500"> 

## Environment

* Front end Library: [Bootstrap](http://getbootstrap.com/)
* Development database: [sqlite3](https://www.sqlite.org/)
* Test and production database: [Postgresql](http://postgresapp.com/)
* Object storage: [qiniu](http://www.qiniu.com/)

## Instructions

* Picture search function can be used without signing in
* Uploading and analyzing pictures requires registering and signing in first
* test username and password: milly, 123456789

## Test

Use cucumber to execute integration tests:

```
rails generate cucumber:install capybara
rails generate cucumber_rails_training_wheels:install
rails generate rspec:install
rake db:test:prepare
cucumber
cucumber features/XX.feature
```

## TODO in the future

1. optimize UI
2. add user permissions
3. batch upload pictures
4. fuzzy search
