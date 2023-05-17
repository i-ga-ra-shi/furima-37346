FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6, mix_case: true) }
    password_confirmation { password }
    kanzi_last_name { person.last.kanji }
    kanzi_first_name { person.first.kanji }
    kana_last_name { person.last.katakana }
    kana_first_name { person.first.katakana }
    date_of_birth { Faker::Date.between(from: '1930-01-01', to: '2018-12-31') }
  end
end
