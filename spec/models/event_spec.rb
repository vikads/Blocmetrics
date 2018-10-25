require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) { Event.create!{name: "Event" }

  it { is_expected.to belong_to(:registeredapp) }

  it { is_expected.to validate_presence_of(:name) }

  describe "attributes" do
     it "should have name attribute" do
       expect(event).to have_attribute(name: "Event name")
     end
  end

end
