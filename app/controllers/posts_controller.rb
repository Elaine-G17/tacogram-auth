class PostsController < ApplicationController

    def index
      @posts = Post.all
      @user = User.all
    end
  
    def new
      @post = Post.new
      @user = User.all
    end
  
    def create
      @post = Post.new
      @post ["user"] = User.all["first_name"]
      @post["body"] = params["post"]["body"]
      @post["image"] = params["post"]["image"]
      @post.save
      redirect_to "/posts"
    end
  
  end