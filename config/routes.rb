Rails.application.routes.draw do
	root 'home#index'

	resources :users,only: [:index] do 
		get :sign_in,on: :collection
		get :sign_up,on: :collection
		post :registration,on: :collection
		post :login,on: :collection			
		get :sign_out,on: :collection	
	end

	resources :chatrooms, param: :slug
  resources :messages
  
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
