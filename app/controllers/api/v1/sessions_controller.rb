class Api::V1::SessionsController < ApplicationController
  #skip_before_action :authenticate_user_from_token!, :only => [:create], :raise => false

  def create
    begin
      @user = User.find_by_email(params[:email])
      user_password = params[:password]
      if @user && @user.valid_password?(user_password)
        if @user.role == 1
          #@user.authentication_token = nil
          #@user.save
          render json: { :user => @user.as_json(:except => [:created_at, :updated_at], :include => [:bus])}, status: 200
        elsif @user.role == 2
          if @user.approve
            render json: { :user => @user.as_json(:except => [:created_at, :updated_at], :include => [:student])}, status: 200
          else
            render json:  "-3", status: 200
          end
        else
          render json:  "0", status: 200
        end
      else
        render json:  "-1", status: 200
      end
    rescue
      render json: "-2", status: 200
    end
  end

end
