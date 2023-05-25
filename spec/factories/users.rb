FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { Faker::Lorem.characters(number: 10, min_alpha: 1, min_numeric: 1)}
    password_confirmation { password }
    kanji_last_name { person.last.kanji }
    kanji_first_name { person.first.kanji }
    kana_last_name { person.last.katakana }
    kana_first_name { person.first.katakana }
    date_of_birth { Faker::Date.between(from: '1930-01-01', to: '2018-12-31') }
  end
end
