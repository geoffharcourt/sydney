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
    def comments
      entry_comments.elements
    end

    def comment
      comments.map(&:to_s).join(' ')
    end

    def alias
      definition
    end
  end

  class AliasComment < SyntaxNode
    def to_s
      comment_text.text_value.strip
    end
  end

  class AliasDefinition < SyntaxNode
    def to_s
      "#{shortcut} = #{command}"
    end

    def shortcut
      prefix.text_value.strip
    end

    def command
      stripped_command = aliased_command.to_s.strip
      stripped_command[1,stripped_command.length - 2]
    end
  end

end