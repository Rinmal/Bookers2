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
    if @nbook.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@nbook)
    else
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(book.id)
    else
      render :edit
    end
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
