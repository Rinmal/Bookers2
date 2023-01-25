class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(book_comment_params)
    @comment.book_id = @book.id
    @book_comments = BookComment.all
    @comment.save
    @book_comment = BookComment.new
  end

  def destroy
    BookComment.find(params[:id]).destroy
    @book_comments = BookComment.all
    @book_comment = BookComment.new
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
