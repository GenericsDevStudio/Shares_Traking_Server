module Api
  module V1
    class FavoritesController < ApplicationController
      def create
        @favorite = Favorite.new(favorite_params)
        if @favorite.save
          render json: @favorite, status: :ok
        else
          render json: @favorite.errors, status: :unprocessable_entity
        end
      end

      def remove
        @favorite = Favorite.find_by(user_id: params[:user_id], share_id: params[:share_id])
        @favorite.destroy
        render json: true, status: :ok
      end

      def index
        @user = User.find(params[:user_id])
        @shares = @user.favorites.map { |fav| fav.share }
        render json: @shares, status: :ok
      end

      def companies
        @user = User.find(params[:user_id])
        @shares = @user.favorites.map { |fav| { id: fav.share_id,
          name: fav.share.name, symbol: fav.share.symbol } }
        render json: @shares, status: :ok
      end

      private

      def favorite_params
        params.permit(:user_id, :share_id)
      end
    end
  end
end
