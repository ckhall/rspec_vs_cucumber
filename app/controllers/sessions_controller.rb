class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if params[:user] && @user = User.where(email: params[:user][:email], password: params[:user][:password]).first
      render :welcome
    else
      redirect_to login_url, notice: 'Bad Login!'
    end
  end
end
