Rails.application.routes.draw do
  get 'lists/new'
  post 'lists'=>'lists#create' #追記
  get 'lists/index'
  get 'lists/show'
  get 'lists/edit'
# get 'homes/top'
# get 'homes/top' => 'homes#top'と同じ意味。
# 以下urlの「/homes/」を消す作業。
  get '/top'=>'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
