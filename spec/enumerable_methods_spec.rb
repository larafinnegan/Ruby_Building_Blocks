require './spec_helper'

describe '#my_each' do 

  it "returns an enumerable if no block given" do 
    expect(my_each([1, 2, 3])).to_be_instance_of(Enumerable)
  end
  
end