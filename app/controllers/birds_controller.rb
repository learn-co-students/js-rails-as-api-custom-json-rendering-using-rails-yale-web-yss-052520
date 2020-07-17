class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
  end

  def show 
    bird = Bird.find(params[:id])
    if bird 
      render json: bird, except: [:created_at, :updated_at]
    # bird will be a falsey value if it is not found
    else 
      render json: {message: 'Bird not found'}
  end 
end