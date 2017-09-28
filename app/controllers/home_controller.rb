class HomeController < ApplicationController
  def index
    redirect_to stats_birth_year_path
  end
end
