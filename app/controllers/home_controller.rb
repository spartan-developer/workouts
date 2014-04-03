class HomeController < ApplicationController
  def index
    @exercises = Exercise.order(:title)
  end
end
