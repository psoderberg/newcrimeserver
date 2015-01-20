json.array!(@dates) do |date|
  json.crimedate date[0]
  json.crimes date[1]
end

json.array!(@weathers) do |weather|
  json.tempdate = weather[0]
  json.temperature =  weather[0]
end