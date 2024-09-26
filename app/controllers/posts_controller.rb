class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    # render json: params[:post]

    # @post = Post.new
    # @post.title = params[:post][:title]
    # @post.content = params[:post][:content]

    # @post = Post.new(title: params[:post][:title],
    #                  content: params[:post][:content])

    @post = Post.new(params[:post].permit(:title, :content))

    if @post.save
      redirect_to posts_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end
end
