class RequestController < ApplicationController

  def index
    Rails.logger.warn "estoy en index"
    SubscribeService.receive()
  end
end
