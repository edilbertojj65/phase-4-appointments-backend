class AppointmentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    ActionController::Parameters.permit_all_parameters = true
    def index
        appointment = Appointment.all
        render json: appointment, include: :patients
        
    end

    #----------------------------------------------------------
    def reviews_index
      appointment = Appointment.find(params[:appointment_id])
      reviews =  appointment.reviews
      render json: reviews, include: :appointments
    end
  
    def review
      review = Review.find(params[:id])
      render json: review, include: :appointments
    end

    #--------------------------------------------------------

    def show
        appointment = Appointment.find(params[:id])
        render json: appointment 
    end

    def destroy
        appointment = Appointment.find_by(id: params[:id])
        appointment.destroy
         head :no_content
        
    end

    
     # POST /Appointment
     def create
        appointment = Appointment.create!(params[:appointment])
        render json: appointment, status: :created
      end
 
 
     def update
        appointment = Appointment.find_by(id: params[:id])
        appointment.update(id: params[:id])
        render json: appointment
      end

    private
  def render_not_found_response
    render json: { error: "Appointment not found" }, status: :not_found
  end

  def appointments_params
     
    params.require(:appointment).permit(:user_name, :appointments_date, :name_patient, :last_namePatient,
    :name_physician, :last_namePhysician, :status)
 end
end
