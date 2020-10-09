class ArtworkSharesController < ApplicationController 


    def create 
        share = ArtworkShare.new(params.require(:share).permit(:viewer_id, :artwork_id))
       
        if share.save
            render json: share
        else
            render json: share.errors.full_messages, status: :unprocessable_entity
        end 
    end 


    def destroy 
        share = ArtworkShare.find(params[:id])
        share.destroy 
        # redirect_to artwork_shares_url 
    end 


    private 
    def art_params 
        params.require(:share).permit(:artwork_id, :viewer_id)
    end 



end 