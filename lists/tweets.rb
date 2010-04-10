lambda do |req, head|
  require 'mustache'
  template = @design_doc["templates"]["tweets"]
  tweets = [];
  start "headers" => {"Content-Type" => "text/html"}
  
  while row = get_row()
    doc = row["value"]
    if (doc["user"])
      tweets << {
        "id" => doc["id"],
        "avatar" => doc["user"]["profile_image_url"],
        "screen_name" => doc["user"]["screen_name"],
        "name" => doc["user"]["name"],
        "text" => doc["text"],
        "created_at" => doc["created_at"]
      }
    end
  end
  
  send(Mustache.render(template, {
    "tweets" => tweets
  }))
end
