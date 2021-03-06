# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

# Allow requests from subdomains
Rails.application.config.hosts << ["api.dariodumlijan.com", "dariodumlijan.herokuapp.com"]

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "http://localhost:3000"
    resource "/mail",
      :headers => :any,
      :expose  => ["Authorization"],
      :methods => [:post]
  end

  allow do
    origins "https://staging.dariodumlijan.com"
    resource "/mail",
      :headers => :any,
      :expose  => ["Authorization"],
      :methods => [:post]
  end
  
  allow do
    origins "https://dariodumlijan.com"
    resource "/mail",
      :headers => :any,
      :expose  => ["Authorization"],
      :methods => [:post]
  end
end
