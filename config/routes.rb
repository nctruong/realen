Rails.application.routes.draw do

  resources :sections do
    resources :sentences
  end

  resources :sentences do
    resources :phrases
  end

  resources :audios
  resources :lessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
