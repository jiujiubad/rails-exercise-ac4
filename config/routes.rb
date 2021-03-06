Rails.application.routes.draw do

  devise_for :users

  resources :events do

    member do
      get :dashboard
    end

    collection do
      get :latest
      get :popular

      post :bulk_update
      post :bulk_delete
    end

    resources :attendees
    resource :detail, :controller => "event_details"

  end

  namespace :admin do
    resources :events
  end

  resources :people

  get 'welcome/say_hello' => 'welcome#say'

  get 'welcome' => 'welcome#index'

  post 'next_step' => 'welcome#next_step', :as => :next_step
  post 'final_step' => 'welcome#final_step', :as => :final_step

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # match ':controller(/:action(/:id(.:format)))', :via => :all

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
