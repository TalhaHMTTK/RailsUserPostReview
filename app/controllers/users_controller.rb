class UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        @user = User.find(params[:id])
    end

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(params.require(:user).permit(:name, :description))
        if @user.save
            redirect_to @user
        else
            render 'new'
        end
    end

    def update
        @user = User.find(params[:id])
        @user.update(params.require(:user).permit(:name, :description))
        if @user.save
            redirect_to @user
        else
            render 'edit'
        end
    end
end
