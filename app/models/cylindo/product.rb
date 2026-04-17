class Cylindo::Product < ApplicationRecord
  has_one :fp_item, foreign_key: :cylindo_product_id

  has_many :features, class_name: 'Cylindo::Feature',
                      foreign_key: :cylindo_product_id,
                      inverse_of: :product

  def to_label
    code
  end
end
