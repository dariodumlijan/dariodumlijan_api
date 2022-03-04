Rails.application.routes.draw do
  root 'main#index'
  post '/mail', :to => 'mail#send'
end
