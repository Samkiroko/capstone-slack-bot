# frozen_string_literal: true

require 'rss'
require 'open-uri'

module Geniebot
  # Get lastest news from nasa
  class GetLastNews < SlackRubyBot::Commands::Base
    command 'nasa_last_new' do |client, data, _match|
      url = 'https://www.nasa.gov/rss/dyn/breaking_news.rss'
      rss = RSS::Parser.parse(open(url).read, false).items # rubocop: disable Security/Open
      0.upto(4) do |index|
        client.say(channel: data.channel, text: rss[index].link)
      end
    end
  end
end
