# frozen_string_literal: true

module Geniebot
  # Bot Documentation
  class Bot < SlackRubyBot::Bot
    help do # rubocop: disable Metrics/BlockLength
      title 'GenieBot'
      desc 'This Bot uses the powerful engine of wolfram API to solve almost any question'

      command :Hi do
        title 'Hi'
        desc 'It greets the user'
        long_desc 'It greets the user'
      end
      command :nasa_last_img do
        title 'nasa_last_img: Nasa latest image from the day'
        desc 'It shows you the official latest picture of the day from'\
        'the official nasa website from their RSS feed'
        long_desc 'It shows you the official latest picture of the day'\
        'from the official nasa website from their RSS feed'
      end
      command :nasa_last_new do
        title "nasa_last_new: Nasa's latests 5 news"
        desc 'It shows you the official latest 5 news of the day from the'\
        'official nasa website from their RSS feed'
        long_desc 'It shows you the official latest 5 news of the day from'\
        'the official nasa website from their RSS feed'
      end
      command :wolfram do
        title 'wolfram: wolfram'
        desc 'It processes a wolfram query'
        long_desc 'It processes a wolfram query using the wolfram API engine'\
        'to resolve an ecuation, question, unit conversion, mathematical'\
        'operation etc...'
      end
    end
  end
end
