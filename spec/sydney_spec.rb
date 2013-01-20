require 'spec_helper'

describe Sydney do

  describe ".parse" do
    context "with a valid alias file" do
    	it "parses the alias file" do
        @parser_result.should be_true
      end
    end

    context "with an invalid alias file" do
      it "raises an exception and reports the offset where the problem occurred" do
        expect {
          Sydney.parse("blah blah")
        }.to raise_error
      end
    end
  end

  describe ".sections" do
    it "returns an array of sections from the file" do
      Sydney.sections(@alias_file).class.should eq(Array)
      Sydney.sections(@alias_file).count.should eq(7)
    end
  end

  describe ".aliases" do
    it "returns an array of the aliases in the file" do
      Sydney.aliases(@alias_file).class.should eq(Array)
      Sydney.aliases(@alias_file).count.should eq(20)
    end
  end
end