class FpItem < ApplicationRecord
  belongs_to :cylindo_product, class_name: 'Cylindo::Product'

  has_many :fp_item_cylindo_options
  has_many :cylindo_options, through: :fp_item_cylindo_options,
                             class_name: 'Cylindo::Option'


  def parent
    return if parent_id.blank?

    FpItem.find parent_id
  end
end
