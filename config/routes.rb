Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  # complete routes one by one, so you understand how they need to be coded. could use resources :articles to get them all
  resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
end
