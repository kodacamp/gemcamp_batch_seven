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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :content))
      redirect_to posts_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to posts_path
    end
  end
end
