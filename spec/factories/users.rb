FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.unique.email}
    password {'1a'+Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name{'山田'}
    first_name{'隆太郎'}
    last_name_kana{'ヤマダ'}
    first_name_kana{'リクタロウ'}
    birthday{'1961-09-26'}
  end
end
