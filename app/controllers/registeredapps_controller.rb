class RegisteredappsController < ApplicationController

  def index
    @user = User.find_by(id: session[:user_id])
    @registeredapps = Registeredapp.all
  end

  def new
    @registeredapp = Registeredapp.new
  end

  def create
    @registeredapp = Registeredapp.new(registeredapp_params)
    @registeredapp.user = current_user

    if @registeredapp.save

      flash[:notice] = "The application was registered."
      redirect_to @registeredapp
    else
      flash.now[:alert] = "There was a problem with the app registration. Try again."
      render :new
    end
  end


  def show
    @registeredapp = Registeredapp.find(params[:id])
    @user = User.find_by(id: session[:user_id])
    @events = @registeredapp.events
    # @events = @registeredapp.events.group_by(&:name)
    # unless @registeredapp.user == current_user
    #   flash[:alert] = "You can not see this app."
    #   redirect_to registeredapp_path
    # end
  end


  def edit
    @registeredapp = Registeredapp.find(params[:id])
  end

  def update
    @registeredapp = Registeredapp.find(params[:id])
    @registeredapp.assign_attributes(registeredapp_params)

    if @registeredapp.save
      flash[:notice] = "Your app have been updated"
      redirect_to @registeredapp
    else
      flash.now[:alert] = "There was an error. Please try to update the app again."
      render :edit
    end
  end

  def destroy
    @registeredapp = Registeredapp.find(params[:id])

    if @registeredapp.destroy
      flash[:notice] = "\"#{@registeredapp.name}\" was deleted successfully."
      redirect_to registeredapps_path
    else
      flash.now[:alert] = "There was an error deleting the app."
      render :show
    end
  end


  private

  def registeredapp_params
    params.require(:registeredapp).permit(:name, :url)
  end
end
