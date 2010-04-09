# TweetEater

TweetEater is a CouchDB application which displays tweets which are harvested from Twitter's streaming API by an accompanying Ruby program.

## Requirements

CouchDB >= 0.10.0, couchapp, Ruby, Rubygems: tweetstream, couchrest

## Install

<pre><code>cd TweetEater
cat > .couchapprc
{"env":{"default":{"db":"http://user:pass@localhost:5984/tweeteater"}}}
^C</code></pre>

*that last line means hit **CTRL-C***

<pre><code>cp _attachments/bin/tweeteater-config.example.yml _attachments/bin/tweeteater-config.yml</code></pre>

(now edit _attachments/bin/tweeteater-config.yml)

## Run

<pre><code>ruby _attachments/bin/tweeteater.rb</code></pre>

## TODO

* Tag couch docs with the keyword they matched against
* Port and extract the 'leisurely' view from the original app
* Update this README
