require 'spec_helper'

describe SydneyAliasFile::AliasComment do

  context "when the alias has a comment" do
    before(:all) do
      @comment = @parser_result.sections[1].entries.first.comment
    end

    describe "#to_s", :focus do
      it "returns the comment text" do
        @comment.to_s.should match(/Continuously tail file live\. This can be useful when tracking activity./)
      end

      it "trims the comment character from the front" do
        @comment.to_s[0,1].should_not include(' ')
      end

      it "trims leading and trailing whitespace and newlines" do
        @comment.to_s[0,2].should_not include(' ')
        @comment.to_s[-3,3].should_not include(' ')
        @comment.to_s.should_not match(/\n/)
      end
    end
  end

  context "when the alias does not have a comment" do
    it "returns an empty string" do
      @parser_result.sections.first.entries.first.comment.should eq('')
    end
  end
end