lambda do |doc|
  emit(doc["id"], doc) if doc["user"]
end