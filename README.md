## USERSテーブル

| Column           | Type    | Options     |
|------------------|---------|-------------|
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |
| family_name_kana | string  | null: false |
| first_name_kana  | string  | null: false |
| birthday_year    | integer | null: false |
| birthday_month   | integer | null: false |
| birthday_day     | integer | null: false |


### Association
・has_many :items
・has_one :address

## ITEMSテーブル

| Column        | Type      | Options     |
|---------------|-----------|-------------|
| item_name     | string    | null: false |
| text          | string    | null: false |
| category      | strong    | null: false |
| status        | string    | null: false |
| shopping_cost | string    | null: false |
| area          | string    | null: false |
| shopping_day  | string    | null: false |
| cost          | integer   | null: false |
| user_id       | reference | null: false, foreign_key: true |

### Association
・belongs_to :user

## ADDRESSテーブル

| Column      | Type    | Options     |
|-------------|---------|-------------|
| postal_cade | integer | null: false |
| prefecture  | string  | null: false |
| city        | strong  | null: false |
| address     | string  | null: false |
| phone_num   | integer | null: false |
| user_id     | reference | null: false, foreign_key: true |


### Association
・belongs_to :user


