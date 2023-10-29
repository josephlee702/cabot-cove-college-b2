# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Resident.destroy_all
Course.destroy_all

john = Resident.create!(name: "John Smith", age: 37, occupation: "Plumber")
maria = Resident.create!(name: "Maria Vasquez", age: 29, occupation: "Teacher")

sewing = Course.create!(name: "Sewing")
baking = Course.create!(name: "Baking")
woodworking = Course.create!(name: "Woodworking")
