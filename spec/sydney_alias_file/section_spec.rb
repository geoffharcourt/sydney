require 'spec_helper'

describe SydneyAliasFile::Section do
  before(:all) { @section = @parser_result.sections[1]}

  describe "#title" do
    before(:each) { @title = @section.title }

    it "returns the title text of the section" do
      @title.should match(/Unix Command Line Aliases/)
    end

    it "removes the leading ## from the title" do
      @title.should_not include('##')
    end

    it "removes leading and trailing whitespace from the title" do
      @title[0,1].should_not include(' ')
      @title[-1,1].should_not include(' ')
      @title.should_not include("\n")
    end
  end

  describe "#entries" do
    it "returns one entry for each alias in the section" do
      @section.entries.count.should eq(11)
    end
  end

end