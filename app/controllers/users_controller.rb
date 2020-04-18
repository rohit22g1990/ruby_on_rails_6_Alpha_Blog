class UsersController < ApplicationController
    before_action :get_user_by_user_id, only: [:edit, :update, :show]
    def new
        @user = User.new
    end

    def show
        @articles = @user.articles        
    end

    def update
        if @user.update(get_user_params)
            flash[:notice] = "User updated successfully"
            # redirect_to edit_user_path(@user)
            redirect_to articles_path
        else
            render 'edit'
        end
    end

    def create
        @user = User.new(get_user_params)
        if @user.save
            flash[:notice] = "Welcome #{ @user.username } to Alpha Blog"
            redirect_to articles_path
        else
            render 'new'
        end
    end

    private

    def get_user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def get_user_by_user_id
        @user = User.find(params[:id])
    end
end