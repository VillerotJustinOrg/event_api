class PersonController < ApplicationController
  def index
    @persons = Person.all
    render json: @persons
  end

  def create
    @person = Person.where("mail = :ml", ml: person_params[:mail])
    if @person != []
      render json: {error: 'Person Already exist'}, status: :unprocessable_entity
      return
    end

    @person = Person.new(person_params)

    if @person.save
      render json: @person, status: :created
    else
      render json: {error: 'Person creation failed'}, status: :unprocessable_entity
    end
    
  end

  def log_in
    # Find Person if exits
    @person = Person.where("mail = :ml", ml: person_params[:mail])

    if @person != []
      @mdp = @person[0]["mdp"]
      Rails.logger.info ""
      Rails.logger.info "person"
      Rails.logger.info ""
      Rails.logger.info @mdp
      Rails.logger.info person_params[:mdp]
      Rails.logger.info ""
      Rails.logger.info "Person end"

      if @mdp != person_params[:mdp]
        render json: {error: 'Login Failed'}, status: :unprocessable_entity
      else
        render json: @person, status: :ok
      end 
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