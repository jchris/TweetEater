#!/usr/bin/ruby
require 'rubygems'
require 'tweetstream'
require 'couchrest'
require 'yaml'
require "pp"

env = ARGV[0] || 'production'

CONFIG = YAML::load(File.open(File.dirname(__FILE__)+"/tweeteater-config.yml"))[env]

DB = CouchRest::database!(CONFIG['database_url'])

recents = []

puts "RUNNING..."

TweetStream::Client.new(CONFIG['twitter_username'],CONFIG['twitter_password']).track(CONFIG['twitter_track_terms']) do |status|
  puts "#{status.user.screen_name} --- #{status.text}"
  
  split_text = status.text.split(/ /)
  
  if status.text.match(/^RT/i)
    short_text = split_text[2..6].join(' ')
  elsif status.user.screen_name == 'plancast'
    short_text = split_text[1..5].join(' ')
  else
    short_text = split_text[0..4].join(' ')
  end
  
  unless recents.include? short_text
    DB.save_doc(status) 
  else
    status["short_text"] = short_text
    status["redundant"] = true
    DB.save_doc(status)
    puts "#### SKIPPED ####  #{short_text}"
  end
  
  recents << short_text
  
  recents.uniq!
  
  recents.shift if recents.size >= 500
  
end

