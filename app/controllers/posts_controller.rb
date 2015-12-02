class PostsController < ApplicationController
  def index
  	#GET /posts
  	@posts = Post.all
  end

  def show
  	#GET /posts/:id
  	@post = Post.find(params[:id])
  end

  def new
  	#GET /post/new
  	@post = Post.new
  end

  def create
  	#post_params
  	@post = Post.new(post_params)

  	#check succesfull save
  	if @post.save
  		redirect_to posts_path
  	else
  		render :new
  	end
  end

  private


 def post_params
 		#params = {post: {title:"from form", author:"form", body:"form"} 
  	params.require(:post).permit(:title, :author, :body)
  end


end
