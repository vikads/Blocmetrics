class Registeredapp < ActiveRecord::Base
  belongs_to :user
  has_many :events

  validates :name, presence: :true
  validates :url, presence: :true, uniqueness: :true
end
