class Item < ApplicationRecord
  # ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :duration

  # ユーザーモデルとのアソシエーション
  belongs_to :user

  # オーダーモデルとのアソシエーション
  has_one :order

  # ActiveStorageの設定
  has_one_attached :image

  # 空欄で保存させないためのバリデーション
  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price
  end

  # 価格のバリデーション
  validates :price, numericality: { only_integer: true, message: 'Half-width number' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }

  # 初期表示（---)を選択させないためのバリデーション
  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :fee_id
    validates :prefecture_id
    validates :duration_id
  end

  def self.search(search)
    if search != ""
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
