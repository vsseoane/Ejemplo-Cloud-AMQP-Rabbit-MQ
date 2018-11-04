class SubscribeService

  def self.receive()
    q = channel.queue("personas", durable: true)
    Rails.logger.warn "estoy en recive()"
    q.subscribe(block: true) do |delivery_info, properties, payload|
      puts "Received #{payload}, message properties are #{properties.inspect}"
      Rails.logger.warn "lo que sigue es el payload"
      Rails.logger.warn payload
    end

  end

  def self.channel
    @channel ||= connection.create_channel
  end

  def self.connection
    @connection ||= Bunny.new(
        host: "toad.rmq.cloudamqp.com",
        port: 5672,
        ssl:false,
        vhost: "uoilpaoq",
        user: "uoilpaoq",
        pass: "JA03xWlWdw0S4Ds_QlueJP5_kQxn6iRo",
        heartbeat: :server, # will use RabbitMQ setting
        frame_max: 131072,
        auth_mechanism: "PLAIN"
    ).start
  end

end