Rails.application.routes.draw do
  devise_for :models

  devise_scope :model do  
    get '/models/sign_out' => 'devise/sessions#destroy'     
  end


  resources :messages do 
    resources :comments
  end
  root "messages#index"
end
