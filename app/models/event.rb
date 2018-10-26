class Event < ActiveRecord::Base
  belongs_to :registeredapp

  validates :name, presence: :true
end
