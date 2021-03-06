Rails.application.routes.draw do
  get 'users/show'
  post 'listings/:id/users/show', to: 'users#show'
  devise_for :users
  resources :users
  resources :calendars
  
  
  resources :conversations, only: [:index, :show, :create] do
   resources :personal_messages, only: [:new, :create, :index]
  end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# routes main page to home
get "/", to: "pages#home", as: "root"
  
  get "/listings", to: "listings#index", as: "listings"
  post "/listings", to: "listings#create"
  get "/listings/new", to: "listings#new", as: "new_listing"
  post "/listings/new", to: "listings#new"
  get "/listings/:id", to: "listings#show", as: "listing"
  put "/listings/:id", to: "listings#update"
  patch "/listings/:id", to: "listings#update"
  delete "/listings/:id", to: "listings#destroy"
  get "/listings/:id/edit", to: "listings#edit", as: "edit_listing"

  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"
  get "/:path", to: "pages#not_found"

 

end
