class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @nbook = Book.new
    @books = Book.all
    @user = User.find(current_user.id)
  end

  def new

  end

  def create
    @books = Book.all
    @nbook = Book.new(book_params)
    @nbook.user_id = current_user.id
    @user = User.find(current_user.id)
    if @nbook.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@nbook)
    else
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user.id)
    @nbook = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
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

  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to books_path
    end
  end
end
