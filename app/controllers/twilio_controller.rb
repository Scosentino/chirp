class TwilioController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def voice
    twiml = Twilio::TwiML::Response.new do |response|
      response.Say "Hello World!"
    end
    render xml: twiml.to_xml
  end
end
