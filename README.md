# TweetEater

TweetEater is a CouchDB application which displays tweets which are harvested from Twitter's streaming API by an accompanying Ruby program.

## Requirements

CouchDB >= 0.10.0, couchapp, Ruby, Rubygems: tweetstream, couchrest

## Install

cd TweetEater
cat > .couchapprc
{"env":{"default":{"db":"http://user:pass@localhost:5984/tweetstream"}}}
^C

*that last line means hit **CTRL-C***

cp _attachments/bin/tweeteater-config.example.yml _attachments/bin/tweeteater-config.yml

(now edit _attachments/bin/tweeteater-config.yml)

## Run

ruby _attachments/bin/tweeteater.rb

## TODO

* Tag couch docs with the keyword they matched against
* Port and extract the 'leisurely' view from the original app
* Update this README
