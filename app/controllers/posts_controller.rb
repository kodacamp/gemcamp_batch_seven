class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :validate_post_owner, only: [:edit, :update, :destroy]
  # before_action :set_post, except: [:index, :new, :create]
  # Todo: Try to learn about callbacks
  # https://www.youtube.com/watch?v=SnRq1_VXVVc

  def index
    Product.where(available: false).where("quantity > '0'")
    Product.where(quantity: 10..100)
    @posts = Post.includes(:categories, :user)
                 .order(created_at: :desc)
                 .page(params[:page])
                 .per(5)
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
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = 'Post created successfully'
      redirect_to posts_path
    else
      flash.now[:alert] = 'Post create failed'
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Post updated successfully'
      redirect_to posts_path
    else
      flash.now[:alert] = 'Post update failed'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, category_ids: [])
  end

  def validate_post_owner
    unless @post.user == current_user
      flash[:alert] = 'the post not belongs to you'
      redirect_to posts_path
    end
  end
end
