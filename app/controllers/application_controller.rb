require "./config/environment"
require "./app/models/user"
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end
  post '/posts' do
    @posts = Post.create(params)
    redirects to '/posts'

  end
  get '/posts' do
    @posts = Post.all
    erb :index
  end
  get '/posts/:id' do
    @posts = Post.find(params[:id])
    erb :show

  end
  get '/posts/:id/edit' do
    @posts = Post.find_by_id(params[:id])
    erb :edit
  end
  patch '/posts/:id' do
    @posts = Post.find_by_id(params[:id])
    @posts.name = params[:name]
    @posts.content = params[:content]
    @posts.save
    erb :show
  end
  delete '/posts/:id/delete' do
    @posts = Post.find_by_id(params[:id])
    @posts.delete
    erb :deleted
  end


end