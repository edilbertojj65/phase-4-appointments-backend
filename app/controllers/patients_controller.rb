class PatientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    ActionController::Parameters.permit_all_parameters = true

    def index
        patients = Patient.all
        render json: patients , include: :appointments
       
    end

    def show
        patient = Patient.find(params[:id])
        render json: patient, include: :appointments
    end

    def destroy
        patient = Patient.find_by(id: params[:id])
        patient.destroy
         head :no_content
        
    end

    
     # POST /Patient
     def create
        patient = Patient.create(params[:patient])
        render json: patient, status: :created
     end
 
 
     def update
        patient = Patient.find_by(id: params[:id])
        patient.update(params)
         render json: patient
     end

    private
  def render_not_found_response
    render json: { error: "patient not found" }, status: :not_found
  end
end
