class RespondersController < ApplicationController
  before_action :set_responder, only: [:show, :update]
  skip_before_action :verify_authenticity_token
  respond_to :json

  def index
   @responder = Responder.all
   render 'responders/index'
  end

  def create
    @responder = Responder.new(responder_create_params)
    respond_to do |format|
      if @responder.save
        format.json { render 'responders/show' }
      else
        format.json { render json: {responder: @responder.errors}, status: :unprocessable_entity }
      end
    end
  end

  def show
    if @responder.present?
      render 'responders/show'
    else
      render json: {message: 'Responder does not exist'}
    end
  end

  def update
    if @responder.blank?
      render json: {message: 'Responder does not exist'}
    else
      if @responder.update_attributes(responder_update_params)
        render 'responders/show'
      else
        render json: {responder: @responder.errors}, status: :unprocessable_entity
      end
    end
  end

  private

  def set_responder
    @responder =  Responder.find_by_name(params[:id])
  end

  def responder_create_params
    p = params.require(:responder).permit(:type, :name, :capacity)
    p[:rescue_type] = p[:type]
    p.except!(:type)
  end

  def responder_update_params
    params.require(:responder).permit(:on_duty)
  end

end
