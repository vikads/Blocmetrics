# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'


10.times do
  Registeredapp.create!(
    name: Faker::App.name ,
    url: Faker::Internet.unique.url,
    user: User.first
  )
end

registeredapps = Registeredapp.all

30.times do
  Event.create!(
    registeredapp: registeredapps.sample,
    name: Faker::Hacker.say_something_smart
  )
end
events = Event.all

puts "Seed finished"
puts "#{Registeredapp.count} registered applications created."
puts "#{Event.count} events created."
