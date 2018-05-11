Rails.application.routes.draw do
  resources :students
  resources :buses
  devise_for :users, path: 'users', controllers: { sessions: 'users/sessions'}
  resources :homes
  namespace :api, defaults: {format: :json} do
   namespace :v1 do
     resources :sessions, :only => [:create]
     resources :registrations do
       collection do
         post :change_password
       end
     end
   end
  end
  root 'homes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
