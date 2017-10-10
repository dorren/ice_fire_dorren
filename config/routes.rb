Rails.application.routes.draw do
  get '/' => 'home#index'

  namespace :stats do
    get :birth_year
    get :house
    get :by_age
    post :within_year
  end
end
