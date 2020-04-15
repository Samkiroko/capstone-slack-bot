# frozen_string_literal: true

require_relative 'config/environment.rb'
require_relative 'lib/bot/genie_bot.rb'
Dotenv.load

# module API authenfication working with wolfram
module Geniebot
  # Search Engine
  class WolframSearch < SlackRubyBot::Commands::Base
    Wolfram.appid = ENV['WOLFRAM_APPID']
    command 'wolfram' do |client, data, _match| # rubocop: disable Lint/UnderscorePrefixedVariableName
      callback = Wolfram::Query.new(_match[:expression]).fetch
      hash = Wolfram::HashPresenter.new(callback).to_hash
      callback = ''
      hash.fetch(:pods, {}).each do |k, v|
        next if v.join('').eql?('')

        callback << ("\n" + k + "\n")
        callback << v.join("\n")
      end

      if callback.eql?('')
        client.message text: "
          No results were found that query.\n
          You might want to try https://google.com/?q=#{(_match[:expression]).split(' ').join('+')}",
                       channel: data.channel
      else
        client.message text: callback, channel: data.channel
      end
    end
  end
end

Geniebot::Bot.run
