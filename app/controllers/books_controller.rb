class BooksController < ApplicationController
  def top
  end

  def new
  	@book = Book.new
  end

  def create
     @book = Book.new(list_params)
     if @book.save
      flash[:notice]="successfully"
     redirect_to book_path(@book.id)
     else
      flash[:alert]= 'error'
      @books = Book.all
      render :index
     end
  end

  def show
  	@book = Book.find(params[:id])
  end

  def index
  	@books = Book.all
  	@book = Book.new#追記してるから気をつけて！！！！！！
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
  	if @book.update(list_params)
  	 flash[:notice]="successfully"
  	redirect_to book_path(@book.id)
    else
     flash.now[:alert]= 'error'
     render :edit
  end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end

  private

  def list_params
  	params.require(:book).permit(:title, :body)
  end
end
