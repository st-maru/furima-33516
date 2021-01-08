class Order < ApplicationRecord
  has_one :buyer_address
  belongs_to :user
  belongs_to :item
end
