Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'links#index'

  resources :links, only: [:index, :create]

  get "/:slug", to: 'links#redirect'
  get "/:slug/info", to: 'links#information'

end
