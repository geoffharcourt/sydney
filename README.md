# Sydney

[![Build Status](https://travis-ci.org/geoffharcourt/sydney.png?branch=master)](undefined)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/geoffharcourt/sydney)

A [Treetop](https://github.com/nathansobo/treetop) parser for bash alias files. Organize your aliases by sections and keep comments associated with the aliases they document.

Sydney was created to feed my process an alias file and feed it to
[cheaters](http://github.com/brettterpstra/cheaters), an excellent
cheatsheet system. The output from Sydney can be a Treetop::Runtime::SyntaxNode tree, an array of the sections in your alias file, or an array of the aliases without section groupings.

## Installation

Install it yourself as:

    $ gem install sydney

## Usage

Feed your alias file to Sydney as a single string.

    Sydney.parse(IO.readlines("/my/home/folder/.aliases").join)

Sydney.parse returns a Treetop syntax tree. If you organize your alias
file into sections, preceeding each section with double-banged comments,
you can use `Sydney.sections` to return an array of Section nodes.

Each section contains one or more AliasEntry nodes. An AliasEntry node
ties comments (AliasComment) before an alias to the definition
(AliasDefinition). See the documentation

## Credits
Sydney was created and is maintained by [Geoff Harcourt](http://github.com/geoffharcourt) at [Five Tool Development](http://fivetool.io).

## Contributing

I'm looking for further ideas for Sydney. Please report parsing issues through [Github Issues](https://github.com/geoffharcourt/sydney/issues). Pull requests for feature additions are welcome!

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request