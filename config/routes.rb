Rails.application.routes.draw do
  get 'stats/index'

  get 'stats/birth_year'

  get 'stats/house'

  match "stats/by_age" => "stats#by_age", as: :stats_by_age, via: [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
