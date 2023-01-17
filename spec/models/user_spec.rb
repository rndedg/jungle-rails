require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "should pass when given vaild password" do
    dave = User.new(
      name: "dave",
      email: "dave@gmail.com",
      password: "123abc",
      password_confirmation: "123abc"
    )

    expect(dave).to be_valid
  end
  
  it "should fail when given an invaild password" do
    dave = User.new(
      name: "dave",
      email: "dave@gmail.com",
      password: "peanut",
      password_confirmation: "123abc"
    )

    expect(dave).to_not be_valid
  end

  # it "should fail when given an email already in use" do
  #   dave = User.new(
  #     name: "dave",
  #     email: "dave@gmail.com",
  #     password: "peanut",
  #     password_confirmation: "123abc"
  #   )
  #   dave.save

  #   mark = User.new(
  #     name: "mark",
  #     email: "dave@gmail.com",
  #     password: "hello",
  #     password_confirmation: "hello"
  #   )
  #   mark.save

  #   expect(mark).to_not be_valid
  # end

  it "should fail when no email passed" do
    dave = User.new(
      name: "dave",
      email: nil,
      password: "peanut",
      password_confirmation: "123abc"
    )

    expect(dave).to_not be_valid
  end

  it "should fail when no name passed" do
    dave = User.new(
      name: nil,
      email: "dave@gmail.com",
      password: "peanut",
      password_confirmation: "123abc"
    )

    expect(dave).to_not be_valid
  end

  it "should fail when password is too short" do
    dave = User.new(
      name: dave,
      email: "dave@gmail.com",
      password: "123",
      password_confirmation: "123"
    )

    expect(dave).to_not be_valid
  end

  it "should fail when password is too long" do
    dave = User.new(
      name: dave,
      email: "dave@gmail.com",
      password: "asdfasdfwefasdfasdfwefasdfasdfwef",
      password_confirmation: "asdfasdfwefasdfasdfwefasdfasdfwef"
    )

    expect(dave).to_not be_valid
  end

  describe '.authenticate_with_credentials' do

    user = User.create({
      name: 'billy',
      email: 'billy@gmail.com',
      password: '1234',
      password_confirmation: '1234',
    })


    it "should pass when given correct credentials" do
      user.save
      validate = User.authenticate_with_credentials(user.email, user.password)
      expect(validate).to_not be_nil
    end

    it "should return nil if the email is incorrect" do
      user.save
      validate = User.authenticate_with_credentials("dave@gmail.com", user.password)
      expect(validate).to be_nil
    end

    it "should return nil if the password is incorrect" do
      user.save
      validate = User.authenticate_with_credentials(user.email, "asdf")
      expect(validate).to be_nil
    end

  end
end
