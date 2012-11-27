require 'rubygems'
require 'mongo'
require 'bcrypt'
require 'mongo_mapper'
# class LoginValidation
# 	include BCrypt
# 	def initialize
# 		@password = Password.create("test4Admin")
# 		@user.update_attribute('test4Admin', @password)
# 		@user.reload!
# 		@db_password = Password.new(@user.password)
# 		p @db_password
# 	end
# end

MongoMapper.connection = Mongo::Connection.new('localhost', 27017)
MongoMapper.database = "inkers"


class User
	include MongoMapper::Document
	key :username, String
	key :password, String

	attr_accessible :username, :password
end

@user = User.first(:username => "admin")
p @user.password
@user_hash = BCrypt::Password.new(@user.password)
p @user_hash
if @user_hash == 'test4Admin'
	p "correct"
else
	p "incorrect"
end
check = User.first(:username => "admin").to_a
p check
if check.empty? == true
	p "user doesnt exists"
else
	p "user exists"
end
# u = User.new
# u.username = "sarsena"
# u.password = BCrypt::Password.create('lol')
# if u.save
# 	p "created"
# else
# 	p "user not created"
# end
#collection.insert({:username => "admin", :password => admin_pass})