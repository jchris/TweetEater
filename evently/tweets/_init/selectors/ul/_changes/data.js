function(r) {
  var v = r.value;
  return {
    screen_name : v.user.screen_name,
    name : v.user.name,
    avatar : v.user.profile_image_url,
    text : $.linkify(v.text),
    id : v._id,
    created_at : v.created_at
  }
}