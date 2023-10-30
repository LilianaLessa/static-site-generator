-- Markup.hs

module Markup
  ( 
    Document,
    Structure (..), -- explanations at https://learn-haskell.blog/03-html/05-modules.html
  )
  where

import Numeric.Natural

type Document
  = [Structure]

data Structure
  = Heading Natural String
  | Paragraph String
  | UnorderedList [String]
  | OrderedList [String]
  | CodeBlock [String]
  