class PostsController < ApplicationController
  before_action :set_article, only:[:edit, :update, :show, :destroy]

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Post is successfully created'
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Post is successfully updated'
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def show
  end

  def index
    @posts = Post.all
  end

  def destroy
    @post.destroy
    flash[:notice] = 'Post is successfully deleted.'
    redirect_to posts_path
  end
  private
    def set_article
      @article = Article.find(params[:id])
    end
    def post_params
      params.require(:post).permit(:title, :body)
    end

end
