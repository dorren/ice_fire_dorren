class StatsController < ApplicationController
  def index
  end

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
    @chars = Character.where.not(birth_year: nil)
              .order(params[:order] || :name)
  end

  def within_year
    char = Character.find(params[:char_id])
    diff = params[:diff].to_i
    @min = char.birth_year - diff
    @max = char.birth_year + diff
    arel = Character.arel_table
    @selected = Character.where(arel[:birth_year].lteq(@max).and(
                    arel[:birth_year].gteq(@min)))
  end
end
