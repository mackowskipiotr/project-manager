Rails.application.routes.draw do
  resources :projects do
  	post :join
  end
  devise_for :users
  root to: "projects#index"
end
