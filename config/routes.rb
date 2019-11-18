Rails.application.routes.draw do
  resources :statics
  get "/statics/hello_world" => "statics#hello_world"
  get "/statics/grade" => "statics#grade"
  get "/statics/pluralizer" => "statics#pluralizer"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
