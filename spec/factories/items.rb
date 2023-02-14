FactoryBot.define do
  factory :item do
    name             { '練習問題' }
    description      { 'HTMLの練習問題です' }
    category_id       { 2 }
    status_id         { 2 }
    shipping_cost_id  { 2 }
    shipping_date_id  { 2 }
    prefecture_id     { 2 }
    price             { 60000 }
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
