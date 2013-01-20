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

  # Parse the supplied string and return a
  # Treetop::Runtime::SyntaxNode tree
  def self.parse(data)
    # Pass the data over to the parser instance
    tree = @@parser.parse(data)

    # If the AST is nil then there was an error during parsing
    # we need to report a simple error message to help the user
    if(tree.nil?)
      raise Exception, "Parse error at offset: #{@@parser.index}"
    end

    self.clean_tree(tree)

    tree
  end

  # Parse the string and return an array of AliasEntry nodes
  def self.aliases(data)
    sections(data).map(&:entries).flatten.map(&:alias).flatten
  end

  # Parse the string and return an array of Section nodes
  def self.sections(data)
    parse(data).sections
  end

  private

  def self.clean_tree(root_node)
    return if(root_node.elements.nil?)
    root_node.elements.delete_if{|node| node.class.name == "Treetop::Runtime::SyntaxNode" }
    root_node.elements.each {|node| self.clean_tree(node) }
  end

end

require 'sydney/sydney_alias_file/node_extensions'