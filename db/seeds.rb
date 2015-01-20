# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'CSV'
require 'date'
require 'zlib'
# Crime.delete_all
CSV.foreach("#{Rails.root}/lib/data/Crimes_-_2013.csv") do |row|
      Crime.create!(
        crime_id: row[0],
        case_number: row[1],
        date: DateTime.strptime(row[2], '%m/%d/%Y %I:%M:%S %p'),
        block: row[3],
        iucr: row[4],
        primary_type: row[5],
        description: row[6],
        location_description: row[7],
        arrest: row[8],
        domestic: row[9],
        beat: row[10],
        district: row[11],
        ward: row[12],
        community_area: row[13],
        fbi_code: row[14],
        x_coordinate: row[15],
        y_coordinate: row[16],
        updated_on: row[18],
        latitude: row[19],
        longitude: row[20],
        location: row[21])
    end
# Weather.delete_all
CSV.foreach("#{Rails.root}/lib/data/OhareTemps2013.csv") do |row|
      Weather.create!(
        date: Date.strptime(row[0], '%m/%d/%Y'),
        max_temperature_f: row[1],
        mean_temperature_f: row[2],
        min_temperature_f: row[3],
        precipitation_in: row[19],
        events: row[21]
        )
      end
# TinyCrime.delete_all
# Zlib::GzipReader.open("#{Rails.root}/lib/data/crime_small.csv.gz") do |gz|
#     gz.each_line {|row|
#         if DateTime.strptime(row[2], '%m/%d/%Y %I:%M:%S %p')

#         TinyCrime.create(
        # crime_id: row[0],
        # case_number: row[1],
        # date: DateTime.strptime(row[2], '%m/%d/%Y %I:%M:%S %p'),
        # block: row[3],
        # iucr: row[4],
        # primary_type: row[5],
        # description: row[6],
        # location_description: row[7],
        # arrest: row[8],
        # domestic: row[9],
        # beat: row[10],
        # district: row[11],
        # ward: row[12],
        # community_area: row[13],
        # fbi_code: row[14],
        # x_coordinate: row[15],
        # y_coordinate: row[16],
        # updated_on: row[18],
        # latitude: row[19],
        # longitude: row[20],
        # location: row[21])
#     end
#         }
#     end