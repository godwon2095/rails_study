Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  post 'like_toggle/:post_id' => 'likes#like_toggle', as: :like_toggle
end
