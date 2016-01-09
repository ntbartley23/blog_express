class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(user_params)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

  end

  def show
  end

  def destroy
    @comment = Comment.find(params[:id])
     if@comment.destroy
      flash[:notice] = "Comment successfully deleted"
    else
      flash[:notice] = "Error"
  end
end
