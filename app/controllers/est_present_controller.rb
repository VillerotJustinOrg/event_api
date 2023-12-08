class EstPresentController < ApplicationController
  def index
    @est_presents = Est_Present.all
    render json: @est_presents
  end

  def create
    @est_present = Est_Present.new(arrival_time)

    if @est_present.save
      render json: @est_present, status: :created
    else
      render json: {error: 'Est_present creation failed'}, status: :unprocessable_entity
    end
  end

  def show
    @est_present = Est_Present.find(params[:id])
    
    if @est_present
      render json: @est_present, status: :ok
    else
      render json: {error: 'Est_present not found'}, status: :not_found
    end
  end

  def destroy
    @est_present = Est_Present.find(params[:id])
    
    if @est_present.destroy
      render json: { message: 'Est_present successfully deleted' }, status: :ok
    else
      render json: {error: 'Est_present deletion failed'}, status: :internal_server_error
    end
  end

  private

  def arrival_time
    params.permit(
      :arrival_time
      :person_id
    )
  end


end
