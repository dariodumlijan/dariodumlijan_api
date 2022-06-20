Rails.application.routes.draw do
  root 'main#index'
  post '/mail', :to => 'mail#send'

  match '*unmatched', to: 'main#index', via: :all
end
