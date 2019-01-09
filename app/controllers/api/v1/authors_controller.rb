module Api
  module V1
    class AuthorsController < ApplicationController
      before_action :set_author, only: %i[show update destroy]

      def index
        authors = Author.includes(:books).paginate(page: params[:page])

        render json: authors, status: :ok
      end

      def show
        render json: @author, status: :ok
      end

      def create
        author = Author.new(author_params)

        if author.save
          render json: author, status: :created
        else
          render json: { error: author.errors }, status: :unprocesable_entity
        end
      end

      def update
        if @author.update(author_params)
          render json: @author, status: :ok
        else
          render json: { error: author.errors }, status: :unprocesable_entity
        end
      end

      def destroy
        @author.destroy

        head :no_content
      end

      private
      def set_author
        @author = Author.find(params[:id])
      end

      def author_params
        params.require(:author).permit(:first_name, :last_name)
      end
    end
  end
end
