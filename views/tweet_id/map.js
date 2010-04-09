function(doc) {
	emit(doc.id, {"_id": doc._id, "text": doc.text, "created_at": doc.created_at, "user": {"screen_name": doc.user.screen_name, "name": doc.user.name, "profile_image_url": doc.user.profile_image_url}});
}