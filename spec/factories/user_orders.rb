FactoryBot.define do
  factory :user_order do
    Faker::Config.locale = :ja
    address = Gimei.unique.address

    post_code { Faker::Address.postcode }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { address.kanji }
    house_number { '青山1-1-1' }
    building_name { 'テスト用マンション' }
    phone_number { Faker::Number.number(digits: 11) }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { 1 }
    item_id { 2 }
  end
end
