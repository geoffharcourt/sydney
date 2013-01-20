require 'spec_helper'

describe Sydney do

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