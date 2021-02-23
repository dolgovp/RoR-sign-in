class SessionController < ApplicationController
  skip_before_action :require_login, only: %i[login create]

  def login
  end

  def create
    user = User.find_by username: params[:username]
    if user&.authenticate(params[:password])
      sign_in user
      redirect_to root_url, success: "Вход осуществлен"
    else
      redirect_to session_login_url, danger: "Пользователь не зарегистрирован"
    end
  end

  def logout
    sign_out
    redirect_to session_login_url, info: "Вы вышли из системы"
  end

  def results
    @result = User.all
    render xml: @result
  end

end
