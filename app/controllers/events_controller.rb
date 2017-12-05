class EventsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]

  def index
    @user = current_user
    @events = Event.all
    @event_menus = @events.first.menus
    @ex_menu = Menu.three_menu
  end

  def show
    @user = current_user
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @user = User.find(current_user.id)
    @event = @user.events.new(event_params)
    if @event.save
      flash[:notice] = "Your event has been saved. Someone will contact you soon."
      redirect_to user_path(@user)
    else
      flash[:alert] = "Looks like something wrong:"
      render :new
    end
  end

  def edit
    @user = User.find(current_user.id)
    @event = Event.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = "Your event has been updated!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "Looks like something went wrong:"
      render :edit
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to user_path(@user)
  end

private

  def event_params
    params.require(:event).permit(:number_of_people, :date_and_time, :party_for)
  end
end
