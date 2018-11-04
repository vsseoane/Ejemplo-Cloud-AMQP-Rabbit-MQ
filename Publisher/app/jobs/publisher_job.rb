
class PublisherJob < ApplicationJob
  queue_as :default

  def perform(message)
    begin
      Rails.logger.warn "estoy en publisher_job y estoy antes de publish"
      PublisherService.publish(message)
      Rails.logger.warn "estoy en publisher_job y estoy DESPUES de publish"
    rescue StandardError => err
      puts "Error publishing message: #{message}, error: #{err}"
      Rails.logger.warn "estoy en publisher_job y estoy aen el error"
    end
  end

end