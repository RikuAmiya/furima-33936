FactoryBot.define do
  factory :user do
    nickname              {"riku"}
    email                 {Faker::Internet.free_email}
    password              {"test1005"}
    password_confirmation {"test1005"}
    family_name           {"全角"}
    first_name            {"全角"}
    family_name_kana      {"ゼンカク"}
    first_name_kana       {"ゼンカク"}
    birthday              {"1999-10-05"}
  end
end
