require 'sydney'

require 'rspec/autorun'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true

  config.before(:all) do
    @alias_file = IO.readlines('spec/fixtures/aliases').join
    @parser_result = Sydney.parse(@alias_file)
  end

end