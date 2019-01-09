module Api
  module V1
    class BooksController < ApplicationController
      before_action :set_author, only: %i[show create]
      before_action :set_book, only: %i[show update destroy]

      def index
        book = Book.includes(:author, :book_copies).
               paginate(page: params[:page])

        render json: book, status: :ok
      end

      def show
        render json: @book, status: :ok
      end

      def create
        book = @author.books.new(book_params)

        if book.save
          render json: book, status: :created
        else
          render json: { error: book.errors }, status: :unprocessable_entity
        end
      end

      private
      def set_author
        @author = Author.find(params[:author_id])
      end

      def set_book
        @book = @author.books.find(params[:id])
      end

      def book_params
        params.require(:book).permit(:title, :author_id)
      end
    end
  end
end
