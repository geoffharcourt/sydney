require 'spec_helper'

describe SydneyAliasFile::AliasDefinition do
  before(:all) do
    @alias_definition = @parser_result.sections[1].entries.first.alias
  end

  describe "#shortcut" do
    it "returns the alias to use at the command line with no leading or trailing whitespace" do
      @alias_definition.shortcut.should eq('tlf')
    end
  end

  describe "#command" do
    it "returns the command to be aliased by the shortcut" do
      @alias_definition.command.should eq('tail -f')
    end
  end

  describe "to_s" do
    it "returns the shortcut and command separated by an equal sign surrounded by single spaces" do
      @alias_definition.to_s.should eq('tlf = tail -f')
    end
  end
end