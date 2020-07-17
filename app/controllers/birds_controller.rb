class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: birds

    # render json: birds, only: [:id, :name, :species]
    # line 8 is doing the same as line 7, but explicityly
    # render json: birds.to_json(except: [:created_at, :updated_at])
    # line 10 achives same as line 6/8 but w alternate way
    render json: birds, except: [:created_at, :updated_at]
    
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: bird

    # pick and choose what we want to send to front-end from server
    # render json: {id: bird.id, name: bird.name, species: bird.species } 
    # render json: bird.slice(:id, :name, :species)

    if bird
      render json: {id: bird.id, name: bird.name, species: bird.species }
    else 
      # custon error messaging in the even that a request is made for a record that doesn't exist
      render json: { message: 'Bird not found' }
    end
  end
end