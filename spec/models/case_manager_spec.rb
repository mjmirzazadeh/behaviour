require "rails_helper"

describe CaseManager do
  it "instanciates with a valid email and password" do
    user = CaseManager.create(email:"a@a.com", password:"12345678")
    expect(user).to be_valid
    expect(user.save).to be true
  end

  it "doesn't instanciate with an unvalid email or password" do
    user = CaseManager.create(email:"a", password:"12345678")
    expect(user).not_to be_valid

    user = CaseManager.new(email:"a@a.com", password:"1234567")
    expect(user).not_to be_valid
  end

  it "should not save with duplicated email" do
    user = CaseManager.create(email:"a@a.com", password:"12345678")
    user.save
    user2 = CaseManager.create(email:"a@a.com", password:"12345678")
    expect(user2).not_to be_valid
  end

  it "should have firstname and lastname" do
    user = CaseManager.create(email:"a", password:"12345678")
    expect(user.respond_to?(:firstname)).to be true
    expect(user.respond_to?(:lastname)).to be true
  end


end