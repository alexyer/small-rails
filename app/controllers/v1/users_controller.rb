class V1::UsersController < ApplicationController
  skip_before_action :authenticate_user_from_token!, only: [:create]

  def create
    @user = User.new user_params

    if @user.save
      render json: @user, serializer: V1::SessionSerializer, root: nil
    else
      render json: { error: 'Wrong parameters' }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
