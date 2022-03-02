class MailController < ApplicationController
  require "dotenv/load"
  require "sendgrid-ruby"
  include SendGrid
  
  def send
    token = request.headers["Authorization"].sub("Bearer ", "")
    params.require(:from)
    params.require(:to)
    params.require(:subject)
    params.require(:body)

    if token == ENV["SENDGRID_API_KEY"]
      from = SendGrid::Email.new(email: params[:from])
      to = SendGrid::Email.new(email: params[:to])
      subject = params[:subject]
      body = SendGrid::Content.new(type: "text/plain", value: params[:body])
      email = SendGrid::Mail.new(from, subject, to, body)

      sendgrid = SendGrid::API.new(api_key: token)
      response = sendgrid.client.mail._("send").post(request_body: email.to_json)
      # puts "___________________"
      # puts response.body
      # puts response.parsed_body
      # puts response.headers
      # puts response.status_code
      # puts "___________________"
    end
  end
end
