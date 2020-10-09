class ArtworksController < ApplicationController

    def index 
        
        art = Artwork.where('artist_id = ?', params['user_id'])
       

        art2 = User
                .select('artwork_shares.id, artworks.title , artworks.image_url, artworks.artist_id')
                .joins(:shared_artworks)
                .where('viewer_id = ?', params['user_id'] )
        render json: art + art2
    
    end

    def create 
        art = Artwork.new(params.require(:artwork).permit(:title, :image_url, :artist_id))
       
        if art.save
            render json: art
        else
            render json: art.errors.full_messages, status: :unprocessable_entity
        end 
    end 

    def show 
        artwork = Artwork.find(params[:id])
        render json: artwork
    end 

    def update 
        artwork = Artwork.find(params[:id])
        if artwork.update(art_params)
            redirect_to artwork_url(artwork)
        else 
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end 

    end

    def destroy 
        artwork = Artwork.find(params[:id])
        artwork.destroy 
        redirect_to artworks_url 
    end 
    private 
    def art_params 
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end 





















end 