Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :answers, only: [:create]
  resources :questions, only: [:index]
  resources :user_answers, only: [:create] do
    collection do
      get :result
    end
  end
end
