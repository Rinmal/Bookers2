class SearchesController < ApplicationController
  def search
    @object = params[:object]
    method = params[:method]
    word = params[:word]
    if @object == 'User'
      @users = User.looks(method, word)
    else
      @books = Book.looks(method, word)
    end
  end
end
