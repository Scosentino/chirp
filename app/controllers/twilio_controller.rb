class TwilioController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def voice
  end
  
  def sms
    sender = params[:From]
    body = params[:Body]
    @chirp = Chirp.new(from: sender, description: body)
    @chirp.save
  end
  
end
