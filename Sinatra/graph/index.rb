require 'rubygems'
require 'sinatra'
require 'haml'
require 'oci8'
load 'configs/stg-config.rb'

get '/' do
  load 'functions/function-graph.rb'
  haml :index, :layout => :layout
end

