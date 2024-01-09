class EstPresentController < ApplicationController
  def index
    @est_presents = EstPresent.all
    render json: @est_presents
  end

  def create
    @est_present = EstPresent.new(arrival_time)

    if @est_present.save
      render json: @est_present, status: :created
    else
      render json: {error: 'Est_present creation failed'}, status: :unprocessable_entity
    end
  end

  def show
    @est_present = EstPresent.find(params[:id])
    
    if @est_present
      render json: @est_present, status: :ok
    else
      render json: {error: 'Est_present not found'}, status: :not_found
    end
  end

  def update

    @est_present = EstPresent.where("persons_id = :id_P", id_P: params[:id])
    
    upd_param = {
      'time' => arrival_time[:time],
      'persons_id' => params[:id],
      'event_id' => arrival_time[:event_id]
    }

    if @est_present.update(upd_param)
      render json: @est_present, status: :ok
    else
      render json: {error: 'Event update failed'}, status: :unprocessable_entity
    end
  end

  def destroy
    @est_present = EstPresent.where("persons_id = :id_P", id_P: params[:id])
    
    if @est_present.destroy
      render json: { message: 'Est_present successfully deleted' }, status: :ok
    else
      render json: {error: 'Est_present deletion failed'}, status: :internal_server_error
    end
  end

  def where
    @est_present = EstPresent.where("persons_id = ?", params[:id])

    Rails.logger.info ""
    Rails.logger.info "est_present"
    Rails.logger.info ""
    Rails.logger.info @est_present
    Rails.logger.info ""
    Rails.logger.info "est_present end"

    if @est_present != []
      @event = Event.find(@est_present[0]["event_id"])

      if @event != []
        render json: @event, status: :ok
      else
        render json: {error: 'Person might not be in event'}, status: :not_found
      end
    else
      render json: {error: 'Est_present not found'}, status: :not_found
    end
  end

  private

  def arrival_time
    params.permit(
      :time,
      :event_id
    )
  end


end
