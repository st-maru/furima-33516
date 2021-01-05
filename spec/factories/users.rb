FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password { '111aaa' }
    password_confirmation { password }
    last_name { gimei.last.kanji }
    first_name { gimei.first.kanji }
    ruby_last_name { gimei.last.katakana }
    ruby_first_name { gimei.first.katakana }
    birth_day { '1985-07-07' }
  end
end
