class ReviewsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    def index
        @review = Review.all
        render json: @review , include: :appointments
    end

    def show
        @review = Review.find(params[:id])
        render json: @review , include: :appointments
    end

    def destroy
        @review = Review.find_by(id: params[:id])
        @review.destroy
         head :no_content
        
    end

    
     # POST /Review
     def create
        @review = Review.create(params)
        render json: @review, status: :created
      end
 
 
     def update
        @review = Review.find_by(id: params[:id])
        @review.update(params)
         render json: @review
     end

    private
  def render_not_found_response
    render json: { error: "Review not found" }, status: :not_found
  end
end
