class LikesController < ApplicationController
  def index
    #debugger
    #params["comment"]["user_id"]
    if params[:user_id]
      render json: Like.where(user_id: params[:user_id])
    else
      render json: Like.all
    end
   
  end

  def create
    #debugger
    like = Like.new(like_params)
    if like.save
      render json: like, status: :created
    else
      render json: like.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to likes_url
  end

  private

  def like_params
    params.require(:like).permit(:user_id,:likeable_id, :likeable_type)
  end
end