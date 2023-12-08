class PersonController < ApplicationController
  def index
    @persons = Person.all
    render json: @persons
  end

  def create
    @person = Person.new(person_params)

    @temp = @person.save

    Rails.logger.info @temp
    Rails.logger.info ""

    if @temp
      render json: @person, status: :created
    else
      render json: {error: 'Person creation failed'}, status: :unprocessable_entity
    end
  end

  def show
    @person = Person.find(params[:id])
    
    if @person
      render json: @person, status: :ok
    else
      render json: {error: 'Person not found'}, status: :not_found
    end
  end

  def update
    @person = Person.find(params[:id])
    
    if @person.update(person_params)
      render json: @person, status: :ok
    else
      render json: {error: 'Person update failed'}, status: :unprocessable_entity
    end
  end

  def destroy
    @person = Person.find(params[:id])
    
    if @person.destroy
      render json: { message: 'Person successfully deleted' }, status: :ok
    else
      render json: {error: 'Person deletion failed'}, status: :internal_server_error
    end
  end

  private

  def person_params
    params.permit(
      :pseudo,
      :avatarimg,
      :phone,
      :mail,
      :mdp
      )
  end



end
