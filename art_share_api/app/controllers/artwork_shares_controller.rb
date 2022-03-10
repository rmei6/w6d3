# app/controllers/artworkshares_controller.rb
class ArtworkSharesController < ApplicationController
  # def index
  #   @artworkshares = ArtworkShare.all

  #   render json: @artworkshares
  # end

  def create
    #debugger
    artworkshare = ArtworkShare.new(artwork_share_params)
    if artworkshare.save
      render json: artworkshare, status: :created
    else
      render json: artworkshare.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def destroy
    @artworkshare = ArtworkShare.find(params[:id])
    @artworkshare.destroy

    render json: @artworkshare
    # redirect_to artworkshares_url
  end

  # def show
  #   @artworkshare = ArtworkShare.find(params[:id])

  #   render json: @artworkshare
  # end

  # def update
  #   @artworkshare = ArtworkShare.find(params[:id])
  #   if @artworkshare.update(artworkshare_params)
  #     redirect_to artworkshare_url(@artworkshare)
  #   else
  #     render json: @artworkshare.errors.full_messages
  #   end
  # end


  private

  def artwork_share_params
    params.require(:artwork_share).permit(:artwork_id,:viewer_id)
  end

end