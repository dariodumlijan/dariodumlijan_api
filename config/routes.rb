Rails.application.routes.draw do
  post '/mail', :to => 'mail#send'
end
