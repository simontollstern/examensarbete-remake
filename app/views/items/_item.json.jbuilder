json.extract! item, :id, :type, :client, :seller, :created, :price, :description, :accepted_q, :accepted_c, :accepted, :start_date, :end_date, :created_at, :updated_at
json.url item_url(item, format: :json)
