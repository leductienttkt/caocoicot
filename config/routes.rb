Rails.application.routes.draw do
  
  root "kho#index"

  resources :nhap
  resources :nhap_dulieu
end
