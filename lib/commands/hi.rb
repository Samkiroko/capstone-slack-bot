# frozen_string_literal: true

module Geniebot
  # Greets
  class Hi < SlackRubyBot::Commands::Base
    command 'hi' do |client, data, _match|
      client.message text: 'Hi! this is a Bot, type help to see useful'\
      'commands', channel: data.channel
    end
  end
end
