class TwilioController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def voice
  end
end
