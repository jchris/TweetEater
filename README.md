# TweetEater

TweetEater is a CouchDB application which displays tweets which are harvested from Twitter's streaming API by an accompanying Ruby program.

## Requirements

CouchDB >= 0.10.0, couchapp, Ruby, Rubygems: tweetstream, couchrest

## Install

    cd TweetEater
    cat > .couchapprc
    {"env":{"default":{"db":"http://user:pass@localhost:5984/tweeteater"}}}
    ^C

*that last line means hit **CTRL-C***

    couchapp push

## Run

    ruby _attachments/bin/tweeteater.rb -d database_url -u username -p password -t 'terms,to,track'

Now view your app at

    http://localhost:5984/tweeteater/_design/tweeteater/index.html

## TODO

* Tag couch docs with the keyword they matched against
* Port and extract the 'leisurely' view from the original app
* Update this README
