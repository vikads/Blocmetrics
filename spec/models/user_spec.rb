require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { User.create!(username: "Username", email: "username@bloc.io", password: "password") }

  it {is_expected.to have_many(:registeredapps) }

  it { is_expected.to validate_presence_of(:username) }


  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to allow_value("username@bloc.io").for(:email) }

  it { is_expected.to validate_presence_of(:password) }

  describe "attributes" do
    it "has username, email, password attributes" do
      expect(user).to have_attributes(username: "Username", email: "username@bloc.io", password: "password")
  end



end
