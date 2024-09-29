class Address < ApplicationRecord
  include MeiliSearch::Rails

  belongs_to :article

  after_touch :index!

  # meilisearch do
  #   attribute :street_address
  # end
end
