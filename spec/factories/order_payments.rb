FactoryBot.define do
  factory :order_payment do
    postcode { '123-1234' }
    prefecture_id { 13 }
    city { '杉並区' }
    block { '青山1-1' }
    building { '東京ハイツ' }
    phone_number{ '08058205200' }
    token {"tok_abcdefghijk00000000000000000"}

    association :user_id
    association :item_id
  end
end
