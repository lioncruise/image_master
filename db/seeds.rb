# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

t=Time.now

p1 = Picture.create({url: '08B58PIC9sE_1024.jpg'})
p2 = Picture.create({url: '597726_20141105000741284200_1.jpg'})
p3 = Picture.create({url: '9142565_143932261108_2.jpg'})
p4 = Picture.create({url: 'rBEhVFIlnXgIAAAAAAKDOVae9RoAACvSwH71-gAAoNR816.jpg'})

tag1 = Tag.create({name: '石头'})
tag1.pictures = [p2,p3]
tag2 = Tag.create({name: '剪刀'})
tag2.pictures = [p4]
tag3 = Tag.create({name: '布'})
tag3.pictures = [p1]