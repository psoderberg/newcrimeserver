json.array!(@datearr) do |date|
  json.crimedate date[0]
  json.crimes date[1]
  json.temperature date[2]
end