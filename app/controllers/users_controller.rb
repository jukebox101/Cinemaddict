class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def index
    @users = User.all
  end

  def show
    # @user = User.find(params[:id])
    @user = User.find_by(id: session[:user_id]) 
  end

  def new
    @errors = flash[:errors]
    @user = User.new
    render :new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to '/welcome'

      # redirect_to user_path(user)
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_path(user)
    end
  end

  def edit
    @errors = flash[:errors]
    @user = User.find_by(id: session[:user_id])
    render :edit
  end

  def update
    user = User.find_by(id: session[:user_id])

    if user.valid?
      user.update(user_params)
      redirect_to user_path(user)
    else
      flash[:errors] = user.errors.full_messages
      redirect_to edit_user_path(user)
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to welcome_path
  end

  def destroy
    user = User.find_by(id: session[:user_id])
    user.destroy

    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :password, :email)
  end


end
