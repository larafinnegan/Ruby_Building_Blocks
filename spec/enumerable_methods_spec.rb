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

  describe "#my_select" do 

    context "when no block is given" do
      it "returns an enumerable object" do 
        expect(base_array.my_select).to be_instance_of(Enumerator)
      end
    end

    context "when a block is given" do
      it "returns an array object" do
        expect(base_array.my_select {|num| num}).to be_instance_of(Array)
      end

      it "returns all elements for which the block returns true" do
        expect(base_array.my_select {|x| x}).to eql(base_array)
        expect(empty_array.my_select {|x| x}).to eql(empty_array)
        expect(with_nil_array.my_select {|x| x}).to eql([9, 6, 5])
        expect(all_false.my_select {|x| x}).to eql(empty_array)
      end

      it "returns all elements for which the block returns true" do
        expect(base_array.my_select {|x| x == 2}).to eql([2])
        expect(empty_array.my_select {|x| x == 2}).to eql(empty_array)
        expect(with_nil_array.my_select {|x| x.nil?}).to eql([nil])
        expect(all_false.my_select {|x| x.nil?}).to eql([nil, nil])
      end
    end
  end

  describe "#my_count" do 

    context "if no block or argument is given" do
      it "returns the size of the array" do
        expect(base_array.my_count).to eql(base_array.size)
        expect(empty_array.my_count).to eql(empty_array.size)
        expect(with_nil_array.my_count).to eql(with_nil_array.size)
        expect(all_false.my_count).to eql(all_false.size)
      end
    end

    context "if an argument is given" do
      it "returns a count of all elements equal to the argument" do
        expect(base_array.my_count(4)).to eql(3)
        expect(empty_array.my_count(2)).to eql(0)
        expect(with_nil_array.my_count(nil)).to eql(1)
        expect(all_false.my_count(false)).to eql(2)

      end
    end

    context "if a block is given" do
      it "returns a count of all elements for which the block returns true" do
        expect(base_array.my_count {|x| x == 2}).to eql(1)
        expect(empty_array.my_count {|x| x > 1}).to eql(0)
        expect(with_nil_array.my_count {|x| x.nil?}).to eql(1)
        expect(all_false.my_count {|x| x}).to eql(0)
      end
    end
  end
end