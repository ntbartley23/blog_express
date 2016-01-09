class PostsController < ApplicationController

  def index
    @post = Post.order(id: :desc)

  end

 def new
    unless current_user
      flash[:alert] = "you must log in to create a post"
      redirect_to(:back)
    else
      @post = Post.new
    end
  end

 

    def create
      
      @post = current_user.posts.create post_params
       redirect_to user_post_path(params[:user_id], @post)
      
   end 

    


  def edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update
      flash[:notice] = "Post successfully updated."
    else
      flash[:notice] = " Post has an error."
  end
  redirect_to :back
end
  def show
    @post = Post.find(params[:id], @post)
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Post Successfully deleted."
    else
      flash[:notice] = " There was a problem deleting the post."
  end
 redirect_to :back
end


private
  def post_params
  params.require(:post).permit(:content, :title)
  end
 end 