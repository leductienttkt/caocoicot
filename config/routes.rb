Rails.application.routes.draw do
  
  root "kho#index"
  resources :kho
end
