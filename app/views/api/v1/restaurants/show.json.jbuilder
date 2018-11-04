json.extract! @restaurant, :id, :name, :address, :description, :image
json.comments @restaurant.comments do |comment|
  json.extract! comment, :id, :content, :name, :image
  json.date comment.created_at.strftime("%m/%d/%y")
end
