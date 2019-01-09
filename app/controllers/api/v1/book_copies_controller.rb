module Api
  module V1
    class BookCopiesController < ApplicationController
      before_action :set_book_copy, only: %i[show update destroy]

      def index
        @book_copies = BookCopy.includes(:book, :user, book: [:author]).paginate(page: params[:page])

        render json: @book_copies, status: :ok
      end

      def show
        render json: @book_copy#, status: :ok
      end

      def create
        book_copy = BookCopy.new(book_copy_params)

        if book_copy.save
          render json: book_copy, status: :created
        else
          render json: { error: book_copy.errors },
                         status: :unprocessable_entity
        end
      end

      def update
        if @book_copy.update(book_copy_params)
          render json: @book_copy, status: :no_content
        else
          render json: { error: @book_copy.errors },
                         status: :unprocessable_entity
        end
      end

      def destroy
        @book_copy.destroy

        head :no_content
      end

      private
      def set_book_copy
        @book_copy = BookCopy.find(params[:id])
      end

      def book_copy_params
        params.require(:book_copy).permit(:book_id, :format, :isbn,
                                          :published, :user_id)
      end
    end
  end
end
