class Article < ApplicationRecord
  include MeiliSearch::Rails

  meilisearch do
    # only the attributes 'title', and 'body' will be sent to Meilisearch
    # all attributes will be sent to Meilisearch if block is left empty
    attribute :title, :body

    searchable_attributes [ :title, :body ]
    # filterable_attributes [ :title ]
    sortable_attributes [ :id ]
    ranking_rules [
      "attribute",
      "sort"
    ]
  end
end
