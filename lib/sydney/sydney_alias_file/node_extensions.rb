 module SydneyAliasFile
  class SyntaxNode < Treetop::Runtime::SyntaxNode
    def to_s
      text_value
    end
  end

  class Document < SyntaxNode
    def sections
      to_a
    end

    def to_a
      elements.map{ |element| element }
    end
  end

  class Section < SyntaxNode
    def title
      section_title.elements.map(&:to_s).join(' ')
    end

    def entries
      content.elements
    end
  end

  class SectionComment < SyntaxNode
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
    def shortcut
      prefix.text_value.strip
    end

    def command
      stripped_command = aliased_command.to_s.strip
      stripped_command[1,stripped_command.length - 2]
    end
  end

end