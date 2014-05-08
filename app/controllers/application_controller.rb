class ApplicationController < ActionController::Base
  protect_from_forgery

  private

    def current_calendar
      Calendar.find(session[:calendar_id])
    rescue ActiveRecord::RecordNotFound
      calendar = Calendar.create
      session[:calendar_id] = calendar.id
      calendar
    end
end
