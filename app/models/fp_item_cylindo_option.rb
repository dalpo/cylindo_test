class FpItemCylindoOption < ApplicationRecord
  belongs_to :fp_item, inverse_of: :fp_item_cylindo_options
  belongs_to :cylindo_option, inverse_of: :fp_item_cylindo_options,
                              class_name: 'Cylindo::Option',
                              foreign_key: :cylindo_option_id
end
