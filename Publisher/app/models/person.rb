class Person < ApplicationRecord
  after_create :notify_creation

  def notify_creation
    PublisherJob.perform_later self
  end
end
