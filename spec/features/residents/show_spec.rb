require "rails_helper"

RSpec.describe "the residents show page" do
  before(:each) do 
    jessica = Resident.create!(name: "Jessica Fletcher", age: 65, occupation: "Mystery Writer")
    crimescenes = Course.create!(name: "Crime Scenes 101")
    fingerprinting = Course.create!(name: "Fingerprinting")
    karate = Course.create!(name: "Karate")
  end
  
  it "lists all resident's courses" do
    jessica.add_course(crimescenes)
    jessica.add_course(fingerprinting)
    jessica.add_course(karate)
    visit "/residents/#{jessica.id}"
    
    expect(page).to have_content(jessica.name)
    expect(page).to have_content("Courses")
    expect(page).to have_content("Crime Scenes 101")
    expect(page).to have_content("Fingerprinting")
    expect(page).to have_content("Karate")
  end
end