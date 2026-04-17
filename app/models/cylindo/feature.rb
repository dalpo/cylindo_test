class Cylindo::Feature < ApplicationRecord
  # WARN: This could be wrong
  #
  # I'm not sure, but a Feature might has many product
  # So.. It might be Features HABTM Products
  #
  # Or we ca remove this releation. It's not really required
  belongs_to :product, class_name: 'Cylindo::Product',
                       foreign_key: :cylindo_product_id,
                       inverse_of: :features

  has_many :options, class_name: 'Cylindo::Option',
                     foreign_key: :cylindo_feature_id,
                     inverse_of: :feature
end
