class BuyerAddress < ApplicationRecord
  # ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  # オーダーモデルとのアソシエーション
  belongs_to :order
end
