require 'rubygems'
require 'sinatra'
require 'securerandom'
require 'mongo'
require 'bcrypt'
require 'mongo_mapper'
require 'haml'

MongoMapper.connection = Mongo::Connection.new('localhost', 27017)
MongoMapper.database = "inkers"

class User
  include MongoMapper::Document
  key :username, String
  key :password, String

  attr_accessible :username, :password
end

enable :sessions

# connection = Mongo::Connection.new('localhost')
# db = connection.db("inkers")
# collection = db.collection("users")

before do 
  'Loading.....'
  session[:id] ||= SecureRandom.hex
end

get '/' do
  @u = session[:user]
  erb :index
end

get '/login' do 
  @session = session[:id]
  erb :login
end

get '/login/error' do
  @session = session[:id]
  erb :loginError
end

get '/user' do
  erb :user
end

get '/create' do
  erb :newUser
end

get '/create/error' do
  erb :createError
end

post '/create' do
  nUser = params[:username]
  nPass = params[:password]
  check = User.first(:username => nUser).to_a
  if check.empty? == true
    u = User.new
    u.username = params[:username]
    u.password = BCrypt::Password.create(params[:password])
    u.save
    redirect '/login'
  else
    redirect '/create/error'
  end
end

post '/login' do
  $username = params[:username]
  $pass = params[:password]
  $user = User.first(:username => $username)
  if $user.to_a.empty? != true
    @user_hash = BCrypt::Password.new($user.password)
  else
    redirect '/login/error'
  end
  if @user_hash == $pass
    redirect '/user'
  else
    redirect '/login/error'
  end
end

get '/logout' do
  session[:user] = nil
  redirect '/'
end
__END__
@@ layout
<html>
  <head>
    <title>Inker Directory</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet" media="screen">
  </head>
  <body>
   <%= yield %>
  </body>
</html>
