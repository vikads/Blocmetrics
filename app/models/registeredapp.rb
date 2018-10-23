class Registeredapp < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :url, presence: true
  validates_uniqueness_of :url

end
