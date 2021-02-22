FactoryBot.define do
  factory :item do
    name              {"test"}
    text              {"aaaaaaaaaaaaaaaaaaaaa"}
    category_id       {2}
    status_id         {2}
    shopping_cost_id  {2}
    shopping_day_id   {2}
    area_id           {2}
    price             {4000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/image2.png'), filename: 'image2.png')
    end
  end
end
