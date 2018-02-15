class Admin::EventsController < ApplicationController
  layout 'admin'
  
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :event_params, only: [:create, :update]

  def index
    @events = Event.all
  end
  
  def show
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    @event.save
    flash.notice = 'Event was successfully created.'
    redirect_to admin_event_path(@event)
  end
  
  def edit
  end
  
  def update
    @event.update(event_params)
    flash.notice = 'Event was successfully updated.'
    redirect_to admin_event_path(@event)
  end
  
  def destroy
    @event.destroy
    flash.notice = "Event was successfully destroyed"
    redirect_to admin_events_path
  end
  
  private
    def set_event
      @event = Event.find(params[:id])
    end
    
    def event_params
      params.require(:event).permit(:title, :location, :start_at, :ticket_price, :ticket_quantity, :event_category_id)
    end
end
