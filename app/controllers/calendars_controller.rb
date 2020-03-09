class CalendarsController < ApplicationController

def index
    @listings_by_date = Listing.group("date(created_at)")
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
   
end


end