Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users

  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/contact'
  get 'welcome/faq'
  get 'welcome/pricing'
  get 'welcome/features'

  resources :companies do
    collection { post :import }
  end

  resources :invoices do
    resources :purchases, except: [:index]
  end
  
  resources :employees
end
