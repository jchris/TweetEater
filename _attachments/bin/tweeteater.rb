#!/usr/bin/ruby
require 'rubygems'
require 'tweetstream'
require 'couchrest'
require 'getoptlong'

opts = GetoptLong.new(
  ['--database', '-d', GetoptLong::REQUIRED_ARGUMENT],
  ['--username', '-u', GetoptLong::REQUIRED_ARGUMENT],
  ['--password', '-p', GetoptLong::REQUIRED_ARGUMENT],
  ['--track',    '-t', GetoptLong::REQUIRED_ARGUMENT]
)  

@conf = {}

opts.each do |opt, arg|
  @conf[opt.sub(/^--/,'')] = arg
end

if @conf.size != 4
  puts "USAGE: #{__FILE__} -d database_url -u username -p password -t 'terms,to,track'"

  exit
end

DB = CouchRest::database!(@conf['database'])

recents = []

puts "RUNNING..."

TweetStream::Client.new(@conf['username'],@conf['password']).track(@conf['track']) do |status|
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

