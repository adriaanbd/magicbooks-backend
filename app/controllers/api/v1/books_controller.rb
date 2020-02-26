class Api::V1::BooksController < ApplicationController
    def index
        books = Book.all
        render json: books
    end

    def create
        book = Book.new(user_params)
        if book.save
            render json: book
        else
            render error: { error: 'Unable to create Book' }, status: 400
        end
    end

    def destroy
        book = Book.find(params[:id])
        if book && book.destroy
            render json: { message: 'Book succesfully deleted' }, status: 200
        else
            render error: { error: 'Unable to delete Book' }, status: 400
        end
    end

    private 

    def user_params
        params.require(:book).permit(:title, :category, :author)
    end
end
