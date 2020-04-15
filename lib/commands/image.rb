# frozen_string_literal: true

require 'rss'
require 'open-uri'

module Geniebot
  # Get last image from nasa
  class GetLastImage < SlackRubyBot::Commands::Base
    command 'nasa_last_img' do |client, data, _match|
      url = 'https://www.nasa.gov/rss/dyn/lg_image_of_the_day.rss'
      rss = RSS::Parser.parse(open(url).read, false).items.first # rubocop: disable Security/Open
      client.say(channel: data.channel, text: rss.link)
    end
  end
end
