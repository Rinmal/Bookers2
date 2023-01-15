class BooksController < ApplicationController

  def index
    @nbook = Book.new
    @books = Book.all
  end

  def new

  end

  def create
    @nbook = Book.new(book_params)
    @nbook.user_id = current_user.id
    @nbook.save
    redirect_to book_path(@nbook)
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
