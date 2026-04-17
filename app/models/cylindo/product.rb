class Cylindo::Product < ApplicationRecord
  has_one :fp_item

  has_many :features, class_name: 'Cylindo::Feature',
                      foreign_key: :cylindo_product_id,
                      inverse_of: :product
end
