require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  let(:test_user) { User.new(username: "Cam", password: "password") }

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }

  it "creates a password digest when given a password" do 
    expect(test_user.password_digest).to_not be_nil
  end 

  it "creates session token before validation" do
    test_user.valid?
    expect(test_user.session_token).to_not be_nil
  end

  describe "#reset_session_token!" do
    it "resets the session token" do
      test_user.valid?
      old_session_token = test_user.session_token
      test_user.reset_session_token!

      #could technically be a collision here
      expect(old_session_token).to_not eq(test_user.session_token)
    end

    it "returns the new session token" do
      expect(test_user.reset_session_token!).to eq(test_user.session_token)
    end
  end

  describe "is_password?" do
    it "verifies a password is correct" do  
      expect(test_user.is_password?("password")).to be true
    end

    it "verifies a password is not correct" do
      expect(test_user.is_password?("pass")).to be false
    end
  end

  describe "::find_by_credentials" do
    it "returns user with valid credentials" do 
      expect(User.find_by_credentials("Cam", "password")).to eq(test_user)
    end

    it "returns nil with invalid credentials" do 
      expect(User.find_by_credentials("No-name", "password")).to eq(nil)
    end
  end

end
