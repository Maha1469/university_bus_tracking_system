class Api::V1::RegistrationsController < ApplicationController
  #skip_before_action :authenticate_user_from_token!, :only => [:create, ], :raise => false
   def create
     begin
       if params[:password] == params[:password_confirmation]
          @user = User.new
          @user.email = params[:email]
          @user.password = params[:password]
          @user.password_confirmation = params[:password_confirmation]
          @user.role = 2
          if @user.save
            @std = Student.new
            @std.name = params[:name]
            @std.roll_number = params[:roll_number]
            @std.batch_number = params[:batch_number]
            @std.semseter = params[:semseter]
            @std.department = params[:name]
            @std.user_id = @user.id
            if @std.save
              render json: { :user => @user.as_json(:except => [:created_at, :updated_at], :include => [:student])}, status: 200
            else
              render json: {:errors => @std.errors.full_messages}, status: 200
            end
          else
            render json: {:errors => @user.errors.full_messages}, status: 200
          end
       else
        render json: "-1", status: 200
       end
     rescue
       render json: "-2", status: 200
     end
   end
end
