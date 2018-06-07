Rails.application.routes.draw do

  get 'contact/new'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  	devise_for :users, :controllers => {:registrations => "registrations"}
	resources :offers do
		resources :proposals, except: :index
		collection do
			get :search
		end
	end
	root 'layouts#index'
	resources :entries, defaults: { format: 'json' }

	get '/myoffers' => 'offers#myoffers'
	get '/myoffers' => 'offers#myproposals'
	get 'offers/:id/proposals/:id/edit', to: 'proposals#edit', as: :edit_proposal
	put 'offers/:id/proposals/:id/edit', to: 'proposals#update'

		resources :contacts, only: [:new, :create]

	resources :users
end
