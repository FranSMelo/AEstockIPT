json.extract! badge, :id, :name, :description, :price, :image_url, :category_id, :created_at, :updated_at
json.url badge_url(badge, format: :json)
