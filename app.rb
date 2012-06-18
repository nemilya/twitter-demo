require 'rubygems'
require 'sinatra'

enable :sessions

before do
  if !session[:logged].nil? && session[:logged]
    @logged = true
  end
end

get '/' do
  erb :index  
end

get '/login' do
  session[:logged] = true
  redirect '/'
end

get '/logout' do
  session.delete(:logged)
  redirect '/'
end

post '/post' do
  content = params[:content]
  # todo
  redirect '/?posted=1'
end