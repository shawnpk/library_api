module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[show update destroy]

      def index
        users = User.preload(:book_copies).paginate(page: params[:page])

        render json: users, status: :ok
      end

      def show
        render json: @user, status: :ok
      end

      def create
        user = User.new(user_params)

        if user.save
          render json: user, status: :created
        else
          render json: { error: user.error }, status: :unprocessable_entity
        end
      end

      def update
        if @user.update(user_params)
          render json: @user, status: :ok
        else
          render json: { error: @user.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        @user.destroy

        head :no_content
      end

      private
      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:first_name, :last_name, :email)
      end
    end
  end
end
