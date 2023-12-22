Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root to: "users#index", as: :authenticated_root
    end

    unauthenticated do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end

  scope "/" do
    resources :users, only: [:index, :show] do
      resources :posts, only:[:index, :show, :new, :create] do
        resources :comments, only:[:new, :create]
        resources :likes, only:[:new, :create]
      end
    end
  end
  get "up" => "rails/health#show", as: :rails_health_check
end
