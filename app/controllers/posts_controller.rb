class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end
#All of the following lines rae commented out and the new create and update using post_params is used. 
#otherwise the following commented out lines will also work-- with the lines that use the params
	def create
	#-----old code---without strong params 	#@post = Post.new(params["post"])
		@post = Post.new(params.require(:post).permit(:title, :description))
		# the above line is to have the usage of strong params
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
#-----	old code line---without stromng params---#@post.update(params["post"])
		@post.update(params.require(:post).permit(:title))
		#the above line is modified to have strong params
	  redirect_to post_path(@post)
	end
	# def create
	# 	@post = Post.new(post_params)
	# 	@post.save
	# 	redirect_to post_path(@post)
	# end
	 
	# def update
	# 	@post = Post.find(params[:id])
	# 	@post.update(post_params)
	# 	redirect_to post
	# end
	 
	# private
	 
	# def post_params
	# 	params.require(:post).permit(:title, :description)
	# end

	def edit
	  @post = Post.find(params[:id])
	end
end
