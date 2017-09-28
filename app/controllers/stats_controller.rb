class StatsController < ApplicationController
  def birth_year
    @hash = Character.all.group(:birth_year).count
  end

  def house
  end

  def by_age
  end
end
