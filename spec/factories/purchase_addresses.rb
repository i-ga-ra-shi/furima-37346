FactoryBot.define do
  factory :purchase_address do
    post_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { '渋谷区' }
    address { '1-1' }
    building { 'アジアビル' }
    phone_number { '09009090909' }
    token { "tok_abcdefghijk00000000000000000" }
  end
end
