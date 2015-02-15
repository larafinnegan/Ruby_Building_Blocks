require './spec_helper'

describe Enumerable do 
  include Enumerable

  let(:base_array) {[9, 4, 3, 2, 7, 4, 4]}
  let(:empty_array) {[]}
  let(:with_nil_array) {[9, nil, 6, 5]}
  let(:all_false) {[nil, false, nil, false]}

  describe "#my_each" do

    context "when no block is given" do
      it "returns an enumerable object" do 
        expect(base_array.my_each).to be_instance_of(Enumerator)
      end
    end

    context "when a block is given" do
      it "returns an array object" do
        expect(base_array.my_each {|num| num}).to be_instance_of(Array)
      end

      it "it returns the original array" do
        expect(base_array.my_each {|num| num * 5}).to eql(base_array)
      end
    
      it "applies the block instructions" do
        expect(base_array.my_each {|num| p num * 5}).to eql(base_array.each {|num| p num * 5})
      end
    end
  end

  describe "my_select" do 

    context "when no block is given" do
      it "returns an enumerable object" do 
        expect(base_array.my_select).to be_instance_of(Enumerator)
      end
    end

    context "when a block is given" do
      it "returns an array object" do
        expect(base_array.my_select {|num| num}).to be_instance_of(Array)
      end
    end
  end
end