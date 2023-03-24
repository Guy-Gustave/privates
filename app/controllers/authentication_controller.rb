class AuthenticationController < ApplicationController

    skip_before_action :authenticate_user

    #post /auth/login
    def login 
        @user = User.find_by_email(params[:email])
        if @user&.authenticate(params[:password])
            token = JwtToken.encode(user_id: @user.id)
            # time = Time.now + 24.hours.to_i
            render json: { token: token,  username: @user.user_name }, status: :ok  #exp: time.strftime("-%d-%m-%Y %H:%M:%S"),
        else
            render json: { error: 'unauthorized' }, status: :unauthorized
        end
    end
end
