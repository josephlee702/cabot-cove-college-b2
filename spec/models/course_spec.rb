require "rails_helper"

RSpec.describe Course, type: :model do

  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :resident_courses}
    it {should have_many(:residents).through(:resident_courses)}
  end

  before(:each) do
    @jessica = Resident.create!(name: "Jessica Fletcher", age: 65, occupation: "Mystery Writer")
    @seth = Resident.create!(name: "Seth Hazlitt", age: 70, occupation: "Town Doctor")
    @jason = Resident.create!(name: "Jason Smith", age: 55, occupation: "Plumber")
    @crimescenes = Course.create!(name: "Crime Scenes 101")
  end

  describe "instance methods" do
    describe '#resident_count' do
      it 'adds residents to a course' do
        @jessica.add_course(@crimescenes)
        expect(@crimescenes.residents).to eq([@jessica])
        expect(@crimescenes.resident_count).to eq(1)
        @seth.add_course(@crimescenes)
        expect(@crimescenes.resident_count).to eq(2)
      end
    end
  end
end
