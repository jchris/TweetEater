lambda do |req, head|
  require 'mustache'
  template = @design_doc["templates"]["tweets"]
  tweets = [];
  while row = get_row()
    doc = row["value"]
    if (doc["user"])
      log(doc.to_json)
      tweets << {
        "id" => doc["id"],
        "avatar" => doc["user"]["profile_image_url"],
        "screen_name" => doc["user"]["screen_name"],
        "name" => doc["user"]["name"],
        "text" => doc["text"],
        "created_at" => doc["created_at"]
      }
    else
      log(row.to_json)
    end
  end
  return("ok")
  # log(template)
  # send(tweets.to_json)
  # send(Mustache.render(template, {
  #   "tweets" => tweets
  # }))
end