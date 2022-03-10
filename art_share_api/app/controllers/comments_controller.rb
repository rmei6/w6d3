class CommentsController < ApplicationController
  def index
    #debugger
    #params["comment"]["user_id"]
    if params[:user_id]
      render json: Comment.where(user_id: params[:user_id])
    elsif params[:artwork_id]
      render json: Comment.where(artwork_id: params[:artwork_id])
    elsif params[:id]
      render json: Comment.where(id: params[:id])
    else
      render json: Comment.all
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
    params.require(:comment).permit(:user_id,:artwork_id,:body)
  end
end