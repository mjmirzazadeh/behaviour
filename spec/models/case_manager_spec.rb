require "rails_helper"

describe CaseManager do
  it "instanciates with a valid email and password" do
    user = CaseManager.create(email:"a@a.com", password:"12345678")
    expect(user).to be_valid
  end

  it "doesn't instanciate with an unvalid email" do
    user = CaseManager.create(email:"a", password:"12345678")
    expect(user).not_to be_valid
  end

  it "doesn't instanciate with an unvalid password" do
    user = CaseManager.create(email:"a@a.com", password:"1234567")
    expect(user).not_to be_valid
  end
  
end