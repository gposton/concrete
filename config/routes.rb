Concrete::Application.routes.draw do
  resources :galleries, :only => [:index, :show]

  get "static_pages/home"

  root :to => 'static_pages#home', :as => :home
end
