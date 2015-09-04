Rails.application.routes.draw do
	
  devise_for :users
	resources :topics do
    resources :bookmarks, only: [:edit, :show, :create, :update, :destroy]
  end

  root to: "home#index"
end
