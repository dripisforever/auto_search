class Users::FacebookLoginsController < ApplicationController

  def create
    @user = User.find_by(facebook_id: params[:facebook_id]) if params[:facebook_id].present?
    if @user
      render json: @user, serializer: CurrentUserSerializer, status: 200
    else
      @new_user = User.create!(user_params)
      render json: @new_user, serializer: CurrentUserSerializer, status: 201
    end
  end

  private

    def user_params
      params.permit(:facebook_id, :username).merge(password: 'password')
    end
end
