module Api
  module V1
    class SharesController < ApplicationController
      def create
        @share = Share.new(share_params)
        if @share.save
          render json: @share, status: :ok
        else
          render json: @share.errors, status: :unprocessable_entity
        end
      end

      def edit
        @share = Share.find_by(symbol: params[:symbol])
        if @share.update_attributes(updating_params)
          render json: @share, status: :ok
        else
          render json: @share.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @share = Share.find(params[:id])
        @share.destroy
        render json: true, status: :ok
      end

      def index
        @shares = Share.all
        render json: @shares, status: :ok
      end

      def companies
        @companies = Share.all.map { |company| { id: company.id, name: company.name,
          symbol: company.symbol } }
        render json: @companies , status: :ok
      end

      private

      def updating_params
        params.permit(:price, :change, :persentChange, :volume,
          :marketCap, :ratio)
      end

      def share_params
        params.permit(:symbol, :name, :price, :change, :persentChange, :volume,
          :marketCap, :ratio)
      end
    end
  end
end
