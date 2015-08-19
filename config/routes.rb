Rails.application.routes.draw do
	
  devise_for :users

	resources :topics
  root to: "home#index"
end
