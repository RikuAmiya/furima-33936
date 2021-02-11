## USERSテーブル

| Column             | Type    | Options     |
|--------------------|---------|-------------|
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| family_name        | string  | null: false |
| first_name         | string  | null: false |
| family_name_kana   | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | date    | null: false |


### Association
・has_many :items
・has_many :purchases
・has_one  :address


## ITEMSテーブル

| Column           | Type      | Options     |
|------------------|-----------|-------------|
| item_name        | string    | null: false |
| text             | text      | null: false |
| category_id      | integer   | null: false |
| status_id        | integer   | null: false |
| shopping_cost_id | integer   | null: false |
| area_id          | integer   | null: false |
| shopping_day_id  | integer   | null: false |
| price            | integer   | null: false |
| user             | reference | null: false, foreign_key: true |

### Association
・belongs_to :users
・has_one    :purchases


## ADDRESSESテーブル

| Column      | Type      | Options     |
|-------------|-----------|-------------|
| postal_cade | string    | null: false |
| prefecture  | string    | null: false |
| city        | strong    | null: false |
| address     | string    | null: false |
| phone_num   | string    | null: false |
| user        | reference | null: false, foreign_key: true |


### Association
・belongs_to :users
・has_one    :purchases


## PURCHASESテーブル

| Column | Type      | Options                        |
|--------|-----------|--------------------------------|
| user   | reference | null: false, foreign_key: true |
| item   | reference | null: false, foreign_key: true |

### Association
・belongs_to :users
・belongs_to :items
・belongs_to :addresses
