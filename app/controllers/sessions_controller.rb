class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_name(params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "Неверный логин или пароль"
    end
  end

  def destroy
  end
end
