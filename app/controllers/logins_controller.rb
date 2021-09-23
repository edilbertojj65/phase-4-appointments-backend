class LoginsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  
  def showlogin
    
    @user = Login.find_by(session[:user_id])
     
    if @user
       render json: @user
     else
      render json: { error: "Not authorized" }, status: :unauthorized
    
  end
    
   # GET /Logins
    def index
        @logins = Login.all
         render json: @logins
     end

     # GET /Logins/:id
     def show
       @login = Login.find(params[:id])
        render json: @login 
     end

    # DELETE /Logins/:id
    def destroy
       
      @login = Login.find_by(id: params[:id])
      @login.destroy
       head :no_content
       
     
     end
    

     # POST /Login
     def create
       
       @login = Login.create(params)
       render json:@login, status: :created
        
      end

     end

     # PATCH /Logins/:id
    def update
       @Login = Login.find_by(id: params[:id])
       @login.update(params)
        render json: @login
    end
  
  private
  def render_not_found_response
    render json: { error: "login not found" }, status: :not_found
  end

end
