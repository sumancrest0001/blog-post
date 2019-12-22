class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]
  before_action :require_admin, only: [:destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to our site! #{@user.name}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update (user_params)
       flash[:success] = "Your account is updated successfully."
       redirect_to posts_path
    else
       render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
      @user_posts = @user.posts.paginate(page: params[:page], per_page: 5)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "user and all the related posts are deleted"
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = "Only admin can perform this action"
      redirect_to root_path
    end
  end
  def require_same_user
    if current_user!= @user and !current_user.admin?
      flash[:danger] = "You can update your own profile only"
      redirect_to root_path
    end
  end
end
