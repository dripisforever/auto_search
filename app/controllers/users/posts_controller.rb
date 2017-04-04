class Users::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    if @user.present?
      render json: @user.posts, status: 200
    else
      render json: { errors: ['User not found']}, status: 422
    end
  end

  private

    def set_user
      @user = User.find(username: params[:username])
    end
end