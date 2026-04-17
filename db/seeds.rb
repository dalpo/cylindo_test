# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#

payload = {
  "code": "BERKELEY 46.5 RGTOFFSET NO TOP",
  "version": 3,
  "customer": 4951,
  "enabled": true,
  "defaultWidth": 720,
  "defaultHeight": 720,
  "productCategory": "Case Goods",
  "features": [
    {
      "code": "FINISH",
      "name": "Finish",
      "isOptional": false,
      "groupId": nil,
      "autoInclude": false,
      "controlsMaterials": true,
      "controlsMeshes": false,
      "options": [
        {
          "code": "ASHSHELLSTAIN",
          "name": "Ash with shell stain",
          "isDefault": false,
          "trackingId": "d9e3e3e7-02b2-11f1-a82b-42010a140002"
        },
        {
          "code": "CHARCOAL",
          "name": "Maple with charcoal stain",
          "isDefault": false,
          "trackingId": "657400f7-02b3-11f1-a82b-42010a140002"
        },
        {
          "code": "CHERRY",
          "name": "Cherry",
          "isDefault": false,
          "trackingId": "99aa8f89-02b9-11f1-a82b-42010a140002"
        },
        {
          "code": "WALNUT",
          "name": "Walnut",
          "isDefault": true,
          "trackingId": "1340d2b6-02b8-11f1-a82b-42010a140002"
        },
        {
          "code": "WHITE_OAK",
          "name": "White oak",
          "isDefault": false,
          "trackingId": "90ff4021-02b8-11f1-a82b-42010a140002"
        },
        {
          "code": "OAKRYESTAIN",
          "name": "Oak with Rye stain",
          "isDefault": false,
          "trackingId": "8b13200e-02b7-11f1-a82b-42010a140002"
        },
        {
          "code": "OAKSALTSTAIN",
          "name": "Oak with Salt stain",
          "isDefault": false,
          "trackingId": "86448a8a-02b4-11f1-a82b-42010a140002"
        }
      ]
    },
    {
      "code": "KNOB PULL",
      "name": "Knob Pull",
      "isOptional": false,
      "groupId": nil,
      "autoInclude": false,
      "controlsMaterials": true,
      "controlsMeshes": false,
      "options": [
        {
          "code": "NATURALSTEEL",
          "name": "Natural Steel",
          "isDefault": true,
          "trackingId": "0669eb04-02b4-11f1-a82b-42010a140002"
        },
        {
          "code": "POLISHEDNICKEL",
          "name": "Polished Nickel",
          "isDefault": false,
          "trackingId": "87fea956-02b5-11f1-a82b-42010a140002"
        }
      ]
    }
  ],
  "dimensionShots": nil,
  "viewerAliases": nil,
  "productAliases": nil
}.with_indifferent_access

# product = FpItem.where(name: payload[:code]).first_or_initialize
# product = FpItem.where(cylindo_product: payload[:code]).first_or_initialize
product = Cylindo::Product.where(code: payload[:code]).first_or_initialize
# product.vendor = payload[:vendor]
product.save!


payload[:features].each do |feature_hash|
  feature = Cylindo::Feature.where(code: feature_hash[:code]).first_or_initialize
  feature.name = feature_hash[:name]
  feature.product = product # This might be wrong
  feature.save!

  # Feature Options
  feature_hash[:options].each do |option_hash|
    option = Cylindo::Option.where(code: option_hash[:code]).first_or_initialize
    option.name = option_hash[:name]
    option.feature = feature
    option.save!
  end
end
