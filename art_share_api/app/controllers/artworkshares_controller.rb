# app/controllers/artworkshares_controller.rb
class ArtworkSharesController < ApplicationController
  def index
    @artworkshares = ArtworkShare.all

    render json: @artworkshares
  end

  def create
    #debugger
    artworkshare = ArtworkShare.new(artworkshare_params)
    if artworkshare.save
      render json: artworkshare
    else
      render json: artworkshare.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @artworkshare = ArtworkShare.find(params[:id])

    render json: @artworkshare
  end

  def update
    @artworkshare = ArtworkShare.find(params[:id])
    if @artworkshare.update(artworkshare_params)
      redirect_to artworkshare_url(@artworkshare)
    else
      render json: @artworkshare.errors.full_messages
    end
  end

  def destroy
    @artworkshare = ArtworkShare.find(params[:id])
    @artworkshare.destroy
    redirect_to artworkshares_url
  end

  def artworkshare_params
    params.require(:artworkshare).permit(:artwork_id,:viewer_id)
  end
end