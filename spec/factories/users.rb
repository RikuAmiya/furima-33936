FactoryBot.define do
  factory :user do
    nickname              {"riku"}
    email                 {"test@example"}
    password              {"0000000"}
    password_confirmation {"0000000"}
    family_name           {"全角"}
    first_name            {"全角"}
    family_name_kana      {"ゼンカク"}
    first_name_kana       {"ゼンカク"}
    birthday              {"1999-10-05"}
  end
end
