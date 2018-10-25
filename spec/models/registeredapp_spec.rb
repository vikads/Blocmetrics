require 'rails_helper'

RSpec.describe Registeredapp, type: :model do

  let(:user) { User.create!(username: "Username", email: "username@bloc.io", password: "password") }
  let(:registeredapp) { Registeredapp.create!{name: "Bloc", url: "https://bloc.io"} }

  it {is_expected.to belong_to(:user) }

  it {is_expected.to have_many(:events) }

  it {is_expected.to validate_presence_of(:name) }
  it {is_expected.to validate_presence_of(:url) }
  it {is_expected.to validate_uniqueness_of(:url) }

  it {is_expected.to validate_presence_of(:user) }


  describe "attributes" do
    it "has name and url attributes" do
      expect(registeredapp).to have_attributes(name: "Bloc", url: "https://bloc.io")
    end
  end
end
