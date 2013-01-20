require 'spec_helper'

describe SydneyAliasFile::AliasEntry do
  before(:all) do
    @alias_entry = @parser_result.sections[1].entries.first
  end

  describe '#comments' do
    it "returns an array of all the AliasComment nodes" do
      @alias_entry.comments.class.should eq(Array)
      @alias_entry.comments.count.should eq(2)
      @alias_entry.comments.first.class.should eq(SydneyAliasFile::AliasComment)
    end
  end

  describe '#comment' do
    it "returns a string with all the comments joined by a space" do
      @alias_entry.comment.class.should eq(String)
      @alias_entry.comment.should eq('Continuously tail file live. This can be useful when tracking activity.')
    end
  end

  describe '#alias' do
    it "returns an AliasDefinition node" do
      @alias_entry.alias.class.should eq(SydneyAliasFile::AliasDefinition)
    end
  end
end