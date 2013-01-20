require 'spec_helper'

describe SydneyAliasFile::Document do
  describe "sections" do
    it "divides the document into sections" do
      @parser_result.sections.count.should eq(7)
    end
  end
end