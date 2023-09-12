class LikesController < ApplicationController
    def create
        like = current_user.likes.create(gourmet_id: params[:gourmet_id]) 
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        like = Like.find_by(gourmet_id: params[:gourmet_id], user_id: current_user.id)
        like.destroy
        redirect_back(fallback_location: root_path)
    end
end