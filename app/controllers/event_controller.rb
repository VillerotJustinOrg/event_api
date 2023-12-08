class EventController < ApplicationController
  def index
    @events = Event.all
    render json: @events
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @event, status: :created
    else
      render json: {error: 'Event creation failed'}, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
    
    if @event
      render json: @event, status: :ok
    else
      render json: {error: 'Event not found'}, status: :not_found
    end
  end

  def update
    @event = Event.find(params[:id])
    
    if @event.update(event_params)
      render json: @event, status: :ok
    else
      render json: {error: 'Event update failed'}, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    
    if @event.destroy
      render json: { message: 'Event successfully deleted' }, status: :ok
    else
      render json: {error: 'Event deletion failed'}, status: :internal_server_error
    end
  end

  def type 
    @eventType = Event.find(params[:id]).event_type

    if @eventType
      render json: @eventType
    else 
      render json: { error: 'Event type not found'}, status: :not_found
    end
  end

  def present
    @est_present = Event.find(params[:id]).est_present

    if @est_present
      render json: @est_present
    else 
      render json: { error: 'Present person not found'}, status: :not_found
    end
  end



  private

  def event_params
    params.permit(
      :name,
      :latitude,
      :longitude,
      :description,
      :address,
      :phone,
      :website,
      :image,
      :rating,
      :event_type_id,
      :est_present_id
      )
  end



end
