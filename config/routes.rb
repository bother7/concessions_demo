Rails.application.routes.draw do
  resources :games
  get "/", to: "games#welcome"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
