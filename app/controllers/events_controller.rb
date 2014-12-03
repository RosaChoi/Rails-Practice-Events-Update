class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def edit
  
  end

  def update
    if @event.update(event_params)
      redirect_to events_path
    else
      render :edit
    end
  end

  def show

  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end
  def event_params
    params.require(:event).permit(
    :date,
    :description,
    :requires_id,
    :capacity,
    :directions,
    )
  end

end
