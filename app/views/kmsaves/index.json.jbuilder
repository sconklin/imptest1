json.array!(@kmsaves) do |kmsafe|
  json.extract! kmsafe, :id, :disk_number, :sector_id, :sector_number_l, :data_l, :data_h
  json.url kmsafe_url(kmsafe, format: :json)
end
