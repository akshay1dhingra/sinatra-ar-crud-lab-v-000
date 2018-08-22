
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to '/posts/new'
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do #ask why the test for 'redirects to /posts' is passing when I did not redirect anything
    #binding.pry
    @post = Post.create(params)


    redirect to '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    binding.pry
    erb :show
  end




end
