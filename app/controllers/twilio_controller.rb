class TwilioController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def voice
  end
  
  def record
    sender = params[:From]
    body = params[:TrascriptionText] 
    input = params[:RecordingUrl]
    @chirp = Chirp.new(from: sender, description: body, url: input)
    @chirp.save
    
    /#
    Record Requirements:
    Say "record a message, then press star, star"
    Record "limit to 10 seconds, allow media url for listening"
    Transcribe "text becomes message body"
    RecordingUrl "option to listen to audio recorded"
    #/
    render :nothing
  end
  
  def sms
    sender = params[:From]
    body = params[:Body]
    @chirp = Chirp.new(from: sender, description: body)
    @chirp.save
  end
  
end

