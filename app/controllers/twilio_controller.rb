class TwilioController < ApplicationController
  skip_before_filter :verify_authenticity_token
  #before_filter: :check_account_sid, only:[:record]
  
  def voice
  end
  
  def record
    sender = params[:From]
    body = params[:TranscriptionText] 
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
  end
  
  def sms
    sender = params[:From]
    body = params[:Body]
    @chirp = Chirp.new(from: sender, description: body)
    @chirp.save
  end
  
  private
  def check_account_sid
    return false unless params[:AccountSid] == "AC117323bc9a4d4653a8edca8ba90293f9"
  end
  
end

