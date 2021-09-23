class PhysiciansController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    def index
        @physician = Physician.all
        render json: @physician , include: :appointments
    end

    def show
        @physician = Physician.find(params[:id])
        render json: @physician , include: :appointments
    end

    def destroy
        @physician = Physician.find_by(id: params[:id])
        @physician.destroy
         head :no_content
        
    end

    
     # POST /Physician
     def create
        @physician = Physician.create(params)
        render json: @physician, status: :created
      end
 
 
     def update
        @physician = Physician.find_by(id: params[:id])
        @physician.update(params)
         render json: @physician
     end

    private
  def render_not_found_response
    render json: { error: "Physician not found" }, status: :not_found
  end
end
