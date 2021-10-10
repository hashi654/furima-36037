FactoryBot.define do
  factory :management_order do
    postal_code { '123-4567'}
    prefecture_id { 2 }
    municipality { '岡山市' }
    address { '岡山駅前' }
    building { 'シャインブライト200'}
    telephone_number { '09020002000' }
    association :user
    association :item
  end
end
