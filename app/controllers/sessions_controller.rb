class SessionsController < ApplicationController
  
    def create
       user = Login.find_by(user_name: params[:user_name])
       if !user
         render json: {error: "no user found"}
       else
         session[:user_id] = user.id
         render json: user
       end
    end

   def destroy
      session.delete :user_id
      head :no_content
   end

   private
  
   def login_params 
      params.permit(:user_name)
   end
  
  end