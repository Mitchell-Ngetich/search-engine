Rails.application.routes.draw do
  resources :user_searches, only: [:new, :create, :update] do
    collection do
      get 'search', to: 'user_searches#search'
    end
  end
  root to: 'user_searches#new'
end