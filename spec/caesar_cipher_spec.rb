require './spec_helper'

describe "#cipher" do
  
  it "translates a single lowercase word" do
    cipher("hello", 1).should == "ifmmp"
  end

  it "translates a single uppercase word" do
    cipher("EUREKA", 2).should == "GWTGMC"
  end

  it "translates the end of the alphabet" do
    cipher("wxyzabcd", 2).should == "yzabcdef"
  end

  it "translates the beginning of the alphabet" do
    cipher("wxyzabcd", -2).should == "uvwxyzab"
  end

  it "doesn't translate input if shift is 0" do
    cipher("TestInput", 0).should == "TestInput"
  end

  it "doesn't translate special characters or spaces" do
    cipher("!@#$%^  &*()} .,?'' ", 5).should == "!@#$%^  &*()} .,?'' "
  end

  it "translates multiple words" do
    cipher("This is a test crazy input", -1).should == "Sghr hr z sdrs bqzyx hmots"
  end

  it "translates a sentence with multiple characters" do
    cipher("Hooray!  Last test.  Or is it?", 3).should == "Krrudb!  Odvw whvw.  Ru lv lw?"
  end

  it "allows shifts greater than 26" do 
    cipher("testingaz", 28).should == "vguvkpicb"
  end
end