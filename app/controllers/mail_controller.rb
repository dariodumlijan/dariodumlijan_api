class MailController < ApplicationController
  require "sendgrid-ruby"
  include SendGrid
  
  def send
    params.require(:authorization)
    params.require(:from)
    params.require(:to)
    params.require(:subject)
    params.require(:body)
    TOKEN = params[:authorization]

    if TOKEN == ENV["SENDGRID_API_KEY"]
      FROM = SendGrid::Email.new(email: params[:from])
      TO = SendGrid::Email.new(email: params[:to])
      SUBJECT = params[:subject]
      BODY = SendGrid::Content.new(type: "text/plain", value: params[:body])
      EMAIL = SendGrid::Mail.new(FROM, SUBJECT, TO, BODY)

      SG = SendGrid::API.new(api_key: TOKEN)
      RESPONSE = SG.client.mail._("send").post(request_body: EMAIL.to_json)
      # puts RESPONSE.body
      # puts RESPONSE.parsed_body
      # puts RESPONSE.headers
      # puts RESPONSE.status_code
    end
  end
end
