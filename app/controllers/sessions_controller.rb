class SessionsController < ApplicationController
    def new
    end

    def create 
        user = User.where("username = ? OR email = ?", params[:session][:username], params[:session][:username]).first
        if !user.nil? && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Successfully Logged in"
            redirect_to articles_path
        else
            flash.now[:alert] = "Incorrect credentials"
            render 'new'
        end              
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out"
        redirect_to root_path
    end
end