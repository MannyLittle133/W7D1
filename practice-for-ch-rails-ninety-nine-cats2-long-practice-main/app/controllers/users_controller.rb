class UsersController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_name)

        if @user.save
            login(@user)
            redirect_to user_url(@user)
        else
            render json: @user.errors.full_messages, status
        end
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
