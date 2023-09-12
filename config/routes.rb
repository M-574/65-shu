Rails.application.routes.draw do
  get 'rooms/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get 'gourmets/top' => 'gourmets#top'
get 'gourmets/Hokkaido' => 'gourmets#Hokkaido'
get 'gourmets/Tokyo' => 'gourmets#Tokyo'
get 'gourmets/Osaka' => 'gourmets#Osaka'
get 'gourmets/Fukuoka' => 'gourmets#Fukuoka'

get 'gourmets/Ginghiskhan' => 'gourmets#Ginghiskhan'
get 'gourmets/Kaisendon' => 'gourmets#Kaisendon'
get 'gourmets/Sappororamen' => 'gourmets#Sappororamen'
get 'gourmets/Hokkaidoelse' => 'gourmets#Hokkaidoelse'

get 'gourmets/Edomaezushi' => 'gourmets#Edomaezushi'
get 'gourmets/Monzyayaki' => 'gourmets#Monzyayaki'
get 'gourmets/Chankonabe' => 'gourmets#Chankonabe'
get 'gourmets/Tokyoelse' => 'gourmets#Tokyoelse'

get 'gourmets/Takoyaki' => 'gourmets#Takoyaki'
get 'gourmets/Okonomiyaki' => 'gourmets#Okonomiyaki'
get 'gourmets/Kushikatu' => 'gourmets#Kushikatu'
get 'gourmets/Osakaelse' => 'gourmets#Osakaelse'

get 'gourmets/Motunabe' => 'gourmets#Motunabe'
get 'gourmets/Hakataramen' => 'gourmets#Hakataramen'
get 'gourmets/Mizutaki' => 'gourmets#Mizutaki'
get 'gourmets/Fukuokaelse' => 'gourmets#Fukuokaelse'

get 'maps/index'
resources :maps, only: [:index]

resources :users do
  member do
  get :following, :followers
  end
end

resources :gourmets do
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create]
end

resources :tests
resources :relationships, only: [:create, :destroy]
resources :messages, :only => [:create]
resources :rooms, :only => [:create, :show]

root  'gourmets#top'
end