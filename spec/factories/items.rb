FactoryBot.define do
  factory :item do
    item_name       { 'MacBookAir' }
    explanation     { 'MacBookAirの2020年モデルです。新モデルを購入したので不要となりました' }
    category_id     { '2' }
    status_id       { '2' }
    cost_id         { '2' }
    prefecture_id   { '2' }
    days_id         { '2' }
    price           { '100000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'flag.png')
    end
  end
end
