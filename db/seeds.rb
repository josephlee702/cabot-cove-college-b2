# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Resident.destroy_all
Course.destroy_all

jessica = Resident.create!(name: "Jessica Fletcher", age: 65, occupation: "Mystery Writer")
seth = Resident.create!(name: "Seth Hazlitt", age: 70, occupation: "Town Doctor")
jason = Resident.create!(name: "Jason Smith", age: 55, occupation: "Plumber")

karate = Course.create!(name: "Sewing")
baking = Course.create!(name: "Baking")
woodworking = Course.create!(name: "Woodworking")
