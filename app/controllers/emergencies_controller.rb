class EmergenciesController < ApplicationController
  before_action :set_emergency, only: [:show, :update]
  skip_before_action :verify_authenticity_token
  respond_to :json

  def index
    @emergency = Emergency.all
    render 'emergencies/index'
  end

  def create
    @emergency = Emergency.new(emergency_create_params)
    respond_to do |format|
      if @emergency.save
        format.json { render json: @emergency }
      else
        format.json { render json: {emergency: frame_error_json(@emergency.errors)}, status: :unprocessable_entity }
      end
    end
  end

  def show
    if @emergency.present?
      render 'emergencies/show'
    else
      render json: {message: 'Emergency Code does not exist'}
    end

  end

  def update
      if @emergency.blank?
        render json: {message: 'Emergency Code does not exist'}
      else
        if @emergency.update_attributes(emergency_update_params)
          render 'emergencies/show'
        else
          render json: {emergency: frame_error_json(@emergency.errors)}, status: :unprocessable_entity
        end
      end
  end

  private

  def set_emergency
    @emergency = Emergency.find_by_code(params[:id])
  end

  def emergency_create_params
    params.require(:emergency).permit(:code, :fire_severity, :medical_severity, :police_severity)
  end

  def frame_error_json(errors)
    errors
    # ret_json = {errors: []}
    # errors.each do |key, value|
    #   ret_json[:errors] << "#{key.titleize} #{value}"
    # end
    # ret_json
  end

  def emergency_update_params
    params.require(:emergency).permit(:fire_severity, :medical_severity, :police_severity)
  end
end
