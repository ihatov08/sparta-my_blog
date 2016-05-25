class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to post_url(@comment.post_id)

  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to post_url(@comment.post_id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    post_id = @comment.post_id
    @comment.destroy
    redirect_to post_url(post_id)
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
