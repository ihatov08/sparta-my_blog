class PostsController < ApplicationController
  before_action :authenticate_author!, only: [ :new, :edit, :create, :edit, :update, :destroy ]
  def index
    @q = Post.order(updated_at: :desc).ransack(params[:q])
    @posts = @q.result.page(params[:page]).per(2)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to "/posts/#{@post.id}"
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to "/posts/#{@post.id}"

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to "/posts"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category)
  end
end
