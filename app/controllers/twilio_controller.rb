require 'twilio-ruby'
require 'pp'
 
class TwilioController < ApplicationController
  include Webhookable
 
  after_filter :set_header
  
  skip_before_action :verify_authenticity_token
 
  def voice
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Hey there. Congrats on integrating Twilio into your Rails 4 app.', :voice => 'alice'
         r.Play 'http://linode.rabasa.com/cantina.mp3'
    end
 
    render_twiml response
  end

  def sms
    pp params
    InboundSms.delay(run_at: 1.seconds.from_now).create!(:phone => params["From"],:fulfilled => false,:data => params.to_json)
    response = Twilio::TwiML::Response.new do |r|
      #r.Message "Hiya buddy!"
      r.Message "I'll be right there."
    end

    render_twiml response    
  end
end