# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(email: 'admin1@naver.com', password: 'qwer1234')
user1 = User.find(1)
user1.add_role :admin

user2 = User.create(email: 'admin2@naver.com', password: 'qwer1234')
user2 = User.find(2)
user2.add_role :admin