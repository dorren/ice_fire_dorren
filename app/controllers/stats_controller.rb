class StatsController < ApplicationController
  def birth_year
    @hash = Character.all.group(:birth_year).count
  end

  def house
    @arr = Membership.joins(:house)
             .select("count(memberships.id) as count, house_id, houses.*")
             .group('houses.id')
             .order(params[:order] || 'houses.name')
  end

  def by_age
  end
end
