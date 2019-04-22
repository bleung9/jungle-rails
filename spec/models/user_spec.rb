require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(first_name: "pika", 
                                last_name: "chu", 
                                email: "pikachu@gmail.com", 
                                password: "asdfasdf", 
                                password_confirmation: "asdfasdf")
                              }

  describe 'Validations' do
    it "should have password and password confirmation fields filled in" do
      expect(subject).to be_valid
    end

    it "should have matching password and password confirmation fields" do
      expect(subject).to be_valid
    end

    it "should have a password length equal to or greater than 5 characters" do
      expect(subject).to be_valid
    end

    it "should have email field filled in" do
      expect(subject).to be_valid
    end

    it "should have first name field filled in" do
      expect(subject).to be_valid
    end

    it "should have last name field filled in" do
      expect(subject).to be_valid
    end

    it "should have a unique email" do
      subject.save!
      subject2 = described_class.create(first_name: "pika", 
                                      last_name: "chu", 
                                      email: "pikapika@gmail.com", 
                                      password: "asdfasdf", 
                                      password_confirmation: "asdfasdf")
      expect(subject2).to be_valid
    end
  end

  describe '.authenticate_with_credentials' do 
    it "should login a user if email and password are correctly entered" do
      subject.save!
      user = User.authenticate_with_credentials("    PiKaChU@gMail.com    ", "asdfasdf")
      expect(user).not_to eq(nil)
    end
  end

end
