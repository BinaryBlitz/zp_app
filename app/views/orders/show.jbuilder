json.extract! @order, :id, :address, :created_at, :updated_at

json.line_items @order.line_items do |line_item|
  json.extract! line_item, :id, :quantity

  json.dish do
    json.extract! line_item.dish, :id, :name, :description, :price, :image_url
  end
end
