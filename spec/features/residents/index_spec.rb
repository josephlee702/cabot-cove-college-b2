require "rails_helper"

RSpec.describe "the residents index page" do
  it "lists all residents' name, age, and occupation" do
    jessica = Resident.create!(name: "Jessica Fletcher", age: 65, occupation: "Mystery Writer")
    seth = Resident.create!(name: "Seth Hazlitt", age: 70, occupation: "Town Doctor") 

    visit "/residents"
    
    expect(page).to have_content(jessica.name)
    expect(page).to have_content(jessica.age)
    expect(page).to have_content(jessica.occupation)
    expect(page).to have_content(seth.name)
    expect(page).to have_content(seth.age)
    expect(page).to have_content(seth.occupation)
  end
end