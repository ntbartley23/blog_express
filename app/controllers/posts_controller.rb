class PostsController < ApplicationController

  def index
    @posts = Post.all.order('created_at DESC')

  end

 def new

  end

 

    def create
      
      @posts = Post.new(posts_params)
      @posts.save
       redirect_to @posts
      
   end 

    


  def edit
  end

  def update
    @posts = Post.find(params[:id])
    if @posts.update
      flash[:notice] = "Post successfully updated."
    else
      flash[:notice] = " Post has an error."
  end
  redirect_to :back
end
  def show
    @posts = Post.find(params[:id])
  end

  def destroy
    @posts = Post.find(params[:id])
    if @posts.destroy
      flash[:notice] = "Post Successfully deleted."
    else
      flash[:notice] = " There was a problem deleting the post."
  end
 redirect_to :back
end


private
  def posts_params
  params.require(:posts).permit(:content, :title)
  end
 end 