class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to:user
  has_one:order

  belongs_to:category
  belongs_to:prefecture
  belongs_to:status
  belongs_to:shipping_cost
  belongs_to:shipping_date

  #空の投稿を保存できないようにする
  validates :name,:description,:image,presence:true
  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :shipping_cost_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :shipping_date_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 0 , message: "can't be blank"}

  validates :price,numericality: { greater_than_or_equal_to:300, less_than_or_equal_to: 9_999_999 },format: { with: /\A[0-9]+\z/ }
  


  has_one_attached :image
end
