require_relative 'spec_helper.rb'

describe "Fibonacci API" do
  it "shows usage on /" do
    expect(get('/').body).to eql "To use this fibonacci number generator please hit /seed_number"
  end

  it "returns first 5 fibonacci number when 5 is provided" do
    expect(get('/5').body).to eql "[0, 1, 1, 2, 3]"
  end

  it "returns a error if the value is not a natural number" do
    expect(get('/-5').status).to eql 400
  end
end
