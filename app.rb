require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'open-uri'
require 'sinatra/json'
require './image_uploader.rb'
require './models/contribution.rb'





enable :sessions

get '/' do
  @contents = Contribution.order('id desc').all
  erb :index
end

post '/new' do
  Contribution.create({
    name: params[:user_name],
    body: params[:body],
    img:  "",
    good: 0,
    bad: 0
  })

  if params[:file]
    image_upload(params[:file])
  end

  redirect '/'
end

 post '/delete/:id' do
    Contribution.find(params[:id]).destroy
    redirect '/'
 end

post '/good/:id' do
    content = Contribution.find(params[:id])
    good = content.good
    content.update({
        good: good + 1
  })
  redirect '/'
end

post '/bad/:id' do
    content = Contribution.find(params[:id])
    bad= content.bad
    content.update({
        bad: bad+ 1
  })
  redirect '/'
end

post '/edit/:id' do
  @content = Contribution.find(params[:id])
  erb :edit
end

post '/renew/:id' do
  content = Contribution.find(params[:id])
  content.update({
    name: params[:user_name],
    body: params[:body]
  })
  redirect '/'
end


get '/login' do
    erb :login
end

get '/signin' do
  erb :sign_in
end

get '/signup' do
  erb :sign_up
end

post '/signin' do
 user =User.find_by(mail: params[:mail])
  if user && user.authenticate(params[:password])
     session[:user] = user.id
   end
   redirect '/'
 end

 post '/signup' do
  @user = User.create(mail:params[:mail],password:params[:password],
  password_confirmation:params[:password_confirmation])
  if @user.persisted?
    session[:user]= @user.id
  end
redirect '/'
end

get '/signout' do
  session[:user] = nil
  redirect '/'
end

get '/articles' do
  @articles = Articles.where(nil).page(params[:page])

end



require 'will_paginate'
require 'will_paginate/active_record'
require 'will_paginate/view_helpers/sinatra'

  get '/' do
  @pager = Post.paginate(:page => params[:page], :per_page => 12)
  slim :blog
  end