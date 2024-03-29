class UsersController < ApplicationController
    skip_before_action :authorize, only: :create

    def create
        user = User.create!(user_params)
        session[:user_id] = user.id # this logs a user in and keeps track of users info in subsequent requests
        render json: user, status: :created 
    end

    def update 
        user = User.find(params[:id])
        user.update!(user_params)
        render json: user, status: :accepted 
    end

    def show 
        render json: @current_user, status: :ok  
    end

    private 

    def user_params
        params.permit(:username, :password, :password_confirmation, :first_name, :last_name, :city, :state, :postal_code, :budget)
    end 

end
