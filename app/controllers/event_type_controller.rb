class EventTypeController < ApplicationController
  def index
    @event_types = Event_type.all
    render json: @event_types
  end

  def create
    @event_type = Event_type.new(event_type_type_params)

    if @event_type.save
      render json: @event_type, status: :created
    else
      render json: {error: 'Event_type creation failed'}, status: :unprocessable_entity
    end
  end

  def show
    @event_type = Event_type.find(params[:id])
    
    if @event_type
      render json: @event_type, status: :ok
    else
      render json: {error: 'Event_type not found'}, status: :not_found
    end
  end

  def update
    @event_type = Event_type.find(params[:id])
    
    if @event_type.update(event_type_type_params)
      render json: @event_type, status: :ok
    else
      render json: {error: 'Event_type update failed'}, status: :unprocessable_entity
    end
  end

  def destroy
    @event_type = Event_type.find(params[:id])
    
    if @event_type.destroy
      render json: { message: 'Event_type successfully deleted' }, status: :ok
    else
      render json: {error: 'Event_type deletion failed'}, status: :internal_server_error
    end
  end

  private

  def event_type_params
    params.permit(
      :name
      )
  end
end
