FactoryBot.define do
  factory :order_form do
    postal_code   { Faker::Number.number(digits: 3).to_s + '-' + Faker::Number.number(digits: 4).to_s }
    prefecture_id { Faker::Number.between(from: 2, to: 47) }
    city          { Faker::Address.city }
    street        { Faker::Address.street_name }
    building      { Faker::Address.secondary_address }
    phone         { Faker::Number.leading_zero_number(digits: rand(10..11)) }
    token         { 'tok_abcdefghijk00000000000000000' }

    after(:build) do |order_form|
      order_form.user_id = FactoryBot.create(:user).id
      order_form.item_id = FactoryBot.create(:item).id 
    end
  end
end