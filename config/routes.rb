Rails.application.routes.draw do

  root "home#index"

  resources :kho
  resources :nhap
  resources :nhap_dulieu
end
