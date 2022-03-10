class CommentController < ApplicationController
  def index
    #params[:id].class == 'User'
    if params[:user_id]
      render json: Comment.find_by_user_id(params[:user_id])
    elsif params[:artwork_id]
      render json: Comment.find_by_artwork_id(params[:artwork_id])
    end
   
  end

  def create
    #debugger
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment, status: :created
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_url
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id,:artwork_id)
  end
end