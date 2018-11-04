class PublisherService

  def self.publish(message)
    queue = channel.queue('personas', durable: true)
    channel.default_exchange.publish(message.to_json, routing_key: queue.name)
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