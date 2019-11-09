class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(login: params[:login])
    if @user
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to posts_path
      else
        flash[:notice] = 'Неверный пароль'
        render :new
      end
    else
      flash[:notice] = 'Пользователь не найден'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to posts_path
  end
end
