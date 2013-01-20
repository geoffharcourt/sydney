 module SydneyAliasFile
  class SyntaxNode < Treetop::Runtime::SyntaxNode
    def to_s
      text_value
    end
  end

  class Document < SyntaxNode
    # Return an array of Section nodes
    def sections
      to_a
    end

    private

    def to_a
      elements.map{ |element| element }
    end
  end

  class Section < SyntaxNode
    # Return all the '##'-led lines in the section as a single string
    def title
      section_title.elements.map(&:to_s).join(' ')
    end

    # Return the AliasEntry nodes as an array
    def entries
      content.elements
    end
  end

  class SectionComment < SyntaxNode
    # Return the comment without surrounding whitespace
    def to_s
      content.text_value.strip
    end
  end

  class AliasEntry < SyntaxNode
    # Return the AliasComment nodes as an array
    def comments
      entry_comments.elements
    end

    # Return the comments as a string
    def comment
      comments.map(&:to_s).join(' ')
    end

    # Return the child AliasDefinition node
    def alias
      definition
    end
  end

  class AliasComment < SyntaxNode
    # Return the comment without the preceding # and surrounding whitespace
    def to_s
      comment_text.text_value.strip
    end
  end

  class AliasDefinition < SyntaxNode
    # Return the alias definition without the preceding 'alias' and
    # surrounding whitespace
    def to_s
      "#{shortcut} = #{command}"
    end

    # Return the command line shortcut (alias)
    def shortcut
      prefix.text_value.strip
    end

    # Return the command to be executed in place of the alias
    def command
      stripped_command = aliased_command.to_s.strip
      stripped_command[1,stripped_command.length - 2]
    end
  end

end