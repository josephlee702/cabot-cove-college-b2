require "rails_helper"

RSpec.describe Resident, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :occupation}
  end

  describe "relationships" do
    it {should have_many :resident_courses}
    it {should have_many(:courses).through(:resident_courses)}
  end

  before(:each) do
    @jessica = Resident.create!(name: "Jessica Fletcher", age: 65, occupation: "Mystery Writer")
    @crimescenes = Course.create!(name: "Crime Scenes 101")
    @fingerprinting = Course.create!(name: "Fingerprinting")
    @karate = Course.create!(name: "Karate")
  end

  describe "instance methods" do
    describe "#add_course" do
      it 'adds courses to a resident' do
        @jessica.add_course(@crimescenes)
        expect(@jessica.courses).to eq([@crimescenes])
        @jessica.add_course(@fingerprinting)
        @jessica.add_course(@karate)
        expect(@jessica.courses).to eq([@crimescenes, @fingerprinting, @karate])
      end
    end
  end
end
