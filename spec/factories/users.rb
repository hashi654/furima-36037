FactoryBot.define do
  factory :user do
    nickname              {'イチロー'}
    email                 {Faker::Internet.free_email}
    password              {'123abc'}
    password_confirmation {password}
    last_name             {'鈴木'}
    first_name            {'一郎'}
    kana_last_name        {'ズズキ'}
    kana_first_name       {'イチロウ'}
    birthday              {1973-10-22}
  end
end