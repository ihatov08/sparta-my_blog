class PostsController < ApplicationController
  before_action :authenticate_author!, only: [ :new, :edit, :create, :edit, :update, :destroy ]
  def index
    @q = Post.order(updated_at: :desc).ransack(params[:q])
    if author_signed_in?
      @posts = @q.result.page(params[:page]).per(2).where(author_id: current_author.id)
    else
      @posts = @q.result.page(params[:page]).per(2)
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
    if author_signed_in?
      unless @post.author_id == current_author.id
        redirect_to root_path, alert: "許可されていないページです。"
      end
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_author.posts.build(post_params)
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
    params.require(:post).permit(:title, :body, :category, :author_id, :post_id)
  end
end
