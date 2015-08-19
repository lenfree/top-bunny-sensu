require 'top/bunny/sensu/version'
require 'bunny'
require 'json'

module Top
  module Bunny
    # rubocop:disable Style/Documentation

    class Sensu
      attr_reader :hostname, :user, :password, :vhost, :client

      def initialize(hostname: 'sensu', user: 'sensu_ro',
                     password: 'sensu_ro', vhost: 'sensu', client: 'localhost')
        @hostname = hostname
        @user = user
        @password = password
        @vhost = vhost
        @client = client
      end

      def ok(check_name:, message:)
        publish(check_name: check_name, message: message,
                level: 0)
      end

      def warning(check_name:, message:)
        publish(check_name: check_name, message: message,
                level: 1)
      end

      def critical(check_name:, message:)
        publish(check_name: check_name, message: message,
                level: 2)
      end

      def checkdata(check_name:, message:, level:)
        {
          name: check_name,
          output: message,
          status: level,
          action: 'create',
          handlers: ['default']
        }
      end

      def msgdata(check_name:, message:, level:)
        {
          client: @client,
          check: checkdata(check_name: check_name, message: message,
                           level: level)
        }
      end

      def publish(check_name:, message:, level:)
        ch = conn.create_channel
        x = ch.direct('results')
        data = msgdata(check_name: check_name, message: message, level: level)
        x.publish(JSON.generate(data))
      end

      def conn
        return @conn if @conn
        @conn = ::Bunny.new(hostname: @hostname,
                          user: @user,
                          password: @password,
                          vhost: @vhost)
        @conn.start
        @conn
      end
    end
  end
end
