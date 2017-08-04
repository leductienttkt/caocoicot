Rails.application.routes.draw do
  
  root "kho#index"

  resources :nhap
end
