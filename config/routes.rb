Rails.application.routes.draw do
  
  resources :projects do
  	resources :tasks do
  		patch :done
  	end
  	post :join
  end
  devise_for :users
  root to: "projects#index"
end
