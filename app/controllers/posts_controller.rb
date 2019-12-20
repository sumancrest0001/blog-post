class PostsController < ApplicationController
  before_action :set_post, only:[:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:success] = 'Post is successfully created'
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def update
    if @post.update(post_params)
      flash[:success] = 'Post is successfully updated'
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def show
  end

  def index
    @posts = Post.paginate(page: params[:page], per_page:5)
  end

  def destroy
    @post.destroy
    flash[:success] = 'Post is successfully deleted.'
    redirect_to posts_path
  end
  private
    def set_post
      @post = Post.find(params[:id])
    end
    def post_params
      params.require(:post).permit(:title, :body)
    end

    def require_same_user
      if current_user != @post.user
        flash[:danger] = "You can only delete your own posts"
        redirect_to root_path
      end
    end
end
