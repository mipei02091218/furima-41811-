FactoryBot.define do
  factory :user do
    nickname               {Faker::Name.initials(number:2)}
    email                  {Faker::Internet.email}
    password               {'a000000'}
    password_confirmation  {'a000000'}
    last_name              {'山田'}
    first_name             {'太郎'}
    last_name_kana         {'ヤマダ'}
    first_name_kana        {'タロウ'}
    birthday               {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end
    