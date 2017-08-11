Rails.application.routes.draw do

  root "home#index"

  resources :kho
  resources :nhap
  resources :xuat
  resources :nhap_dulieu
  resources :gomhang
  resources :trahang
end
