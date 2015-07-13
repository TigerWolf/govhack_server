class V1 < Grape::API
  prefix 'api'
  version 'v1'
  format :json

  resource :services do
    get :list do
      require 'csv'
      data = CSV.read("app/data/specialisedservices1213.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all})
      hospitals = []
      data.each do |row|
        h = row.to_hash
        h.each { |k, v| h[k] = v == 2 unless [:establishment_identifier, :establishment_name].include? k }
        hospitals << h
      end

      # binding.pry
      hospitals
    end
end

end
