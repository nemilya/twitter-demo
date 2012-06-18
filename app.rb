require 'rubygems'
require 'sinatra'
require 'omniauth-twitter'

enable :sessions

require 'init_omniauth'

before do
  if !session[:token].nil? && session[:token]
    @logged = true
  end
end

get '/' do
  erb :index  
end

get '/auth/twitter/callback' do
  auth_hash = request.env['omniauth.auth']
  session[:secret] = auth_hash[:credentials][:secret]
  session[:token] = auth_hash[:credentials][:token]
  redirect '/'
end


get '/logout' do
  session.delete(:secret)
  session.delete(:token)
  redirect '/'
end

post '/post' do
  content = params[:content]
  # todo
  redirect '/?posted=1'
end

