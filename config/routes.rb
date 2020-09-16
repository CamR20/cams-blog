Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'stace', to: 'pages#stace'
  get 'westfield', to: 'pages#westfield'
  get 'oktra', to: 'pages#oktra'
  # complete routes one by one, so you understand how they need to be coded. could use resources :articles to get them all
  resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  get 'signup', to: 'users#new'
  # the below ensures that all paths are set up except the new which is set up above
  resources :users, except: [:new]
  resources :categories, except: [:destroy]
end
