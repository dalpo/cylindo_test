class Cylindo::Option < ApplicationRecord
  belongs_to :feature, class_name: 'Cylindo::Feature',
                       foreign_key: :cylindo_feature_id,
                       inverse_of: :options

  has_many :fp_item_cylindo_options, foreign_key: :cylindo_option_id
  has_many :fp_items, through: :fp_item_cylindo_options


  def to_label
    [
      feature&.name,
      name
    ].join(' / ')
  end
end
