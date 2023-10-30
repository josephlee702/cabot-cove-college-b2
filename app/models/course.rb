class Course < ApplicationRecord
  has_many :resident_courses
  has_many :residents, through: :resident_courses
  validates :name, presence: true

  def resident_count
    residents.count
  end
end
