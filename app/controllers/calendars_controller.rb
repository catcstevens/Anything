class CalendarsController < ApplicationController

    #will add a date created at to the calendar
def index
    @listings_by_date = Listing.group("date(created_at)")
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
   
end


end