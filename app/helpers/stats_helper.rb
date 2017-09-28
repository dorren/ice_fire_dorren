module StatsHelper
  def year_str(year)
    if year.nil?
      "Unknown"
    elsif year < 0
      "#{year} BC"
    else
      "#{year} AC"
    end
  end
end
