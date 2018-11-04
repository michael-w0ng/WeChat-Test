# json.restaurants @restaurants do |restaurant|
#   json.extract! restaurant, :id, :name, :address, :description, :image
# end

json.restaurants do
  json.array! @restaurants do |restaurant|
    json.extract! restaurant, :id, :name, :address, :description, :image
  end
end
