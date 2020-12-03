FactoryBot.define do
  factory :order_address do
    item_id       { 1 }
    user_id       { 1 }
    token         { "tok_abcdefghijk00000000000000000" }
    postal_code   { '123-4567' }
    prefecture_id { 1 }
    city          { '東京都' }
    address       { '1-1' }
    building      { '桂ハイツ' }
    phone_number  { '09012345678' }
  end
end
