Rails.application.routes.draw do

  resources :employees do
    collection do
      post '/create', :action => :create
    end

    member do
      get '/show',      :action => :show
      patch '/update',  :action => :update
      delete '/delete', :action => :destroy
    end
  end

  post '/authenticate', :controller => :authentication, :action => :authenticate
end
