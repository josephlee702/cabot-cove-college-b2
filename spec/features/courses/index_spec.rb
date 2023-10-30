require "rails_helper"

RSpec.describe "the courses index page" do
  before(:each) do
    @jessica = Resident.create!(name: "Jessica Fletcher", age: 65, occupation: "Mystery Writer")
    @seth = Resident.create!(name: "Seth Hazlitt", age: 70, occupation: "Town Doctor")
    @jason = Resident.create!(name: "Jason Smith", age: 55, occupation: "Plumber")
    @crimescenes = Course.create!(name: "Crime Scenes 101")
    @fingerprinting = Course.create!(name: "Fingerprinting")
    @karate = Course.create!(name: "Karate")
  end

  it "lists all courses, as well as the number of residents in each course" do
    @jessica.add_course(@crimescenes)
    @jessica.add_course(@fingerprinting)
    @jessica.add_course(@karate)
    @seth.add_course(@crimescenes)
    @seth.add_course(@fingerprinting)
    @jason.add_course(@crimescenes)
    @jason.add_course(@karate)
    
    visit "/courses"
    
    expect(page).to have_content(@crimescenes.name)
    expect(page).to have_content(@fingerprinting.name)
    expect(page).to have_content(@karate.name)
    expect(@crimescenes.resident_count).to eq(3)
    expect(@fingerprinting.resident_count).to eq(2)
    expect(@karate.resident_count).to eq(2)
  end
end