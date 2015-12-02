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

  def edit
  	@post = Post.find(params[:id])
  end
  
  def update
  	@post = Post.find(params[:id])
  	if @post.update(post_params)
  		redirect_to posts_path
  	else
  		render :edit
  	end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

	private


 def post_params
 		#params = {post: {title:"from form", author:"form", body:"form"} 
  	params.require(:post).permit(:title, :author, :body)
  end


end
