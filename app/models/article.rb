class Article < ApplicationRecord
  include MeiliSearch::Rails

  has_many :addresses, class_name: "Address", dependent: :destroy

  # If your association uses belongs_to
  # - use `touch: true`
  # - do not define an `after_save` hook
  after_save { addresses.each(&:touch) }

  meilisearch do
    # only the attributes 'title', and 'body' will be sent to Meilisearch
    # all attributes will be sent to Meilisearch if block is left empty
    attribute :title, :body

    attribute :addresses do
      addresses.pluck(:street_address)
    end

    # searchable_attributes [ :title, :body ]
    # # filterable_attributes [ :title ]
    # sortable_attributes [ :id ]
    # ranking_rules [
    #   "attribute",
    #   "sort"
    # ]
  end
end
