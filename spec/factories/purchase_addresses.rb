FactoryBot.define do
  factory :purchase_address do
    postal_code       { '123-4567' }
    area_id           { 3 }
    city              { '福岡市' }
    address           { '福岡1−1−１' }
    phone_num         { '08000000000' }
    building          { '青山ハイツ' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end