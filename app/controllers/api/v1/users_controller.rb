require 'digest/md5'

module Api
  module V1
    class UsersController < ApplicationController

      def create
        @user = User.new(user_params)
        @user.password = User.getSecurePassword(params[:password])
        if @user.save
          render json: @user, status: :ok
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def update
        @user = User.find(params[:id])
          @user.password = User.getSecurePassword(params[:password])
          if @user.update_attributes(user_params)
            render json: @user, status: :ok
          else
            render json: @user.errors, status: :unprocessable_entity
          end
        else
          render json: { error: 'User is not founded.' }, status: :unprocessable_entity
      end

      def show
        @user = User.find(params[:id])
        render json: @user, status: :ok
      end

      def destroy
        @user = User.find(params[:id])
        @user.destroy
        render json: true, status: :ok
      end

      def getFavorites
        
      end

      def authorization
        @user = User.find_by(email: params[:email],
            password: User.getSecurePassword(params[:password]))
        if @user
          render json: @user, status: :ok
        else
          render json: { error: 'User is not founded.' }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.permit(:name, :email)
      end
    end
  end
end
