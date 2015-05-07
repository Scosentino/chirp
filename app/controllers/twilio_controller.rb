class TwilioController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter: :check_account_sid, only:[:record]
  
  def voice
  end
  
  def record
    callid = params[:CallSid]
    sender = params[:From]
    body = params[:TranscriptionText]
    input = params[:RecordingUrl]
    @chirp = Chirp.new(call_sid: callid, from: sender, description: body, url: input)
    @chirp.save
  end
  
  def transcription
    @chirp = Chirp.find_by_call_sid(params[:CallSid])
    @chirp.description = params[:TranscriptionText]
    @chirp.save
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

