class SightingsController < ApplicationController


    # GROSS!

    # def show
    #     @sighting = Sighting.find(params[:id])
    #     render json: @sighting.to_json(:include => {:bird => {:only =>[:name, :species]},
    #     :location => {:only =>[:latitude, :longitude]}}, 
    #     :except => [:updated_at])
    # end

    # BETTER

    def show
        sighting = Sighting.find_by(id: params[:id])
        render json: SightingSerializer.new(sighting).to_serialized_json
            #using service class to keep logic out of the controller.
      end
   
    #GROSS !

    # def index
    #     sightings = Sighting.all
    #     render json: sightings.to_json(:include => {:bird => {:only =>[:name, :species]},
    #     :location => {:only =>[:latitude, :longitude]}}, 
    #     :except => [:updated_at])
    # end

    # BETTER!

    def index
        sighting = Sighting.all 
        render json: SightingSerializer.new(sightings).to_serialized_json
            #using service class to keep excessive logic out of the controller
    end
end
