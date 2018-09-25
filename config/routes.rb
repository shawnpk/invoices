Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users

  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/contact'
  get 'welcome/faq'
  get 'welcome/pricing'
  get 'welcome/features'

  resources :invoices
end
