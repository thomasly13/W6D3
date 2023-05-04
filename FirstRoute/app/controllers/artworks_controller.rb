class ArtworksController < ApplicationController
    def index
        # if params.has_key?(:user_id)
        #   # index of nested resource
        #   @artworks = Artwork.where(artist_id: params[:user_id])
        # else
        #   # index of top-level resource
        #   @artworks = Artwork.all
        # end
        

        @artworks = Artwork.artworks_for_user_id(params[:user_id])
        render json: @artworks
    end

    def show 
        Artwork.find(artist_id: params[:user_id])
        render json: @artworks
    end 

    def create
        @artwork = Artwork.new(artwork_params)
        if @artwork.save
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: 'You suck a little bit'
        end
    end

    def destroy
        @artwork = Artwork.find(params[:user_id])
        @artwork.destroy
        render json: @artwork
    end

    def update
        @artwork = Artwork.find(params[:user_id])
        if @artwork.update (artwork_params)
            redirect_to artwork_url
        else
            render json: @artwork.errors.full_messages, status: 'You suck alot'
        end

    end



    private
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end


    
end
