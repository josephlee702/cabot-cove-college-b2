class Resident < ApplicationRecord
  has_many :resident_courses
  has_many :courses, through: :resident_courses
  validates :name, presence: true
  validates :age, presence: true
  validates :occupation, presence: true

  def add_course(course)
    courses << course
  end

  def self.average_age
    average(:age).round(2)
  end
end
