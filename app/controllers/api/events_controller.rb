class API::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  before_filter :set_access_control_headers

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*' #allow requests from any origin

    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS' #permit post get and otions request methods

    headers['Access-Control-Allow-Headers'] = 'Content-Type' #allow the header Content-Type, which is used in HTTP requests to declare the type of the data being sent
  end

  def create
    @registeredapp = Registeredapp.find_by(url: request.env['HTTP_ORIGIN'])

    if @registeredapp.nil?
      render jason: "Unregistered application", status: :unproccessable_entity
    end

    @event = @registeredapp.events.new(event_params)

    if @event.save
      render json: @event, status: :created
    else
      render json: {errors: @event.errors}, status: :unproccessable_entity
    end

  end

  def preflight
    head 200
  end


  private

  def event_params
    params.require(:event).permit(:name)
  end
end
