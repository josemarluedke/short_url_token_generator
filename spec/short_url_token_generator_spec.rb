require 'spec_helper'

describe ShortUrlTokenGenerator do
  describe 'mapping' do
    it "should be array" do
      ShortUrlTokenGenerator.mapping.should be_instance_of(Array)
    end
  end
  
  describe 'base notation' do
    it 'should be return 10' do
      ShortUrlTokenGenerator.base_notation(10).should eq "10"
    end
    
    it 'should be return 1-0' do
      ShortUrlTokenGenerator.base_notation(62).should eq "1-0"
    end
    
    it 'should be return 1-1' do
      ShortUrlTokenGenerator.base_notation(63).should eq "1-1"
    end
    
    it 'should be return 2-2' do
      ShortUrlTokenGenerator.base_notation(26, 12).should eq "2-2"
    end
  end
  
  describe 'generate' do
    it "should be return the first character" do
      ShortUrlTokenGenerator.generate(0).should eq ShortUrlTokenGenerator.mapping[0]
    end
    
    it "should be return the correct characters" do
      ShortUrlTokenGenerator.generate(134).should eq "#{ShortUrlTokenGenerator.mapping[2]}#{ShortUrlTokenGenerator.mapping[10]}"
    end
  end
  
  describe "decode" do
    it 'should be return correct num of token' do
      ShortUrlTokenGenerator.decode("#{ShortUrlTokenGenerator.mapping[2]}#{ShortUrlTokenGenerator.mapping[10]}").should eq 134
    end
    
    it 'should be return -1, because token is > 15' do
      ShortUrlTokenGenerator.decode("oJC8RZuYg2pTrAIK").should eq -1
    end
  end
end