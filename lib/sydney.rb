require "sydney/version"

require "treetop"

module Sydney

  # Load the Treetop grammar from the 'sexp_parser' file, and
  # create a new instance of that parser as a class variable
  # so we don't have to re-create it every time we need to
  # parse a string
  Treetop.load(File.join(
          File.dirname(__FILE__),
          "/sydney/sydney_alias_file/grammar_rules.treetop")
  )
  @@parser = SydneyAliasFileParser.new

  def self.parse(data)
    # Pass the data over to the parser instance
    tree = @@parser.parse(data)

    # If the AST is nil then there was an error during parsing
    # we need to report a simple error message to help the user
    if(tree.nil?)
      raise Exception, "Parse error at offset: #{@@parser.index}"
    end

    return tree
  end

end

require 'sydney/sydney_alias_file/node_extensions'