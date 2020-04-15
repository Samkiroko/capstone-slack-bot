# frozen_string_literal: true

require 'rspec/expectations'
require 'spec_helper'

require_relative '../config/environment.rb'
require_relative '../lib/bot/genie_bot.rb'

RSpec.describe 'GenieBot' do
  it 'Hints help', :vcr do
    expected_text = "*Weather Bot* - This bot tells you the weather.\n\n"\
    "*Commands:*\n*clouds* - Tells you how many clouds there're above you.\n"\
    "*command_without_description*\n*What's the weather in <city>?* "\
    "- Tells you the weather in a <city>.\n*GenieBot* "\
    "- This Bot uses the powerful engine of wolfram API to solve almost any question\n\n"\
    "*Commands:*\n*Hi* - It greets the user\n*nasa_last_img: Nasa latest image from the day*"\
    ' - It shows you the official latest picture of the day fromthe official nasa website '\
    "from their RSS feed\n*nasa_last_new: Nasa's latests 5 news* - It shows you the official "\
    "latest 5 news of the day from theofficial nasa website from their RSS feed\n*wolfram: wolfram*"\
    " - It processes a wolfram query\n\n*Other commands:*\n*help* - Shows help information.\n*hi*"\
    " - Says hello.\n*hello* - Says hello.\n\nFor getting description of the command use: "\
    "*help <command>*\n\nFor more information see https://github.com/slack-ruby/slack-ruby-bot, please.\n"
    expect(
      message: "#{SlackRubyBot.config.user} Help"
    ).to respond_with_slack_message(expected_text)
  end
  it 'Says hi', :vcr do
    expect(
      message: "#{SlackRubyBot.config.user} hi"
    ).to respond_with_slack_message('Hi! this is a Bot, type help to see useful'\
     'commands')
  end

  it 'Ignores unknown commands' do
    expect(message: "#{SlackRubyBot.config.user} unknown").to respond_with_slack_message('Sorry <@user>,'\
    " I don't understand that command!")
  end

  it 'Post the last NASA picture url (match *http pattern verification)', :vcr do
    expect(
      message: "#{SlackRubyBot.config.user} nasa_last_img"
    ).to respond_with_slack_message(/http:/)
  end

  it 'Post the last NASA picture url (match *www pattern verification)', :vcr do
    expect(
      message: "#{SlackRubyBot.config.user} nasa_last_img"
    ).to respond_with_slack_message(/www/)
  end

  it 'Post the last NASA picture url (match *gov pattern verification)', :vcr do
    expect(
      message: "#{SlackRubyBot.config.user} nasa_last_img"
    ).to respond_with_slack_message(/gov/)
  end

  it 'Post the last NASA news', :vcr do
    expect(
      message: "#{SlackRubyBot.config.user} nasa_last_new"
    ).to respond_with_slack_messages(%w[])
  end

  it 'Responds a wolfram query', :vcr do
    expect(
      message: '{SlackRubyBot.config.user} wolfram'
    ).to respond_with_slack_messages(%w[])
  end
end
