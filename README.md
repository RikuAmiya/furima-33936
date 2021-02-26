## USERSテーブル

| Column             | Type    | Options     |
|--------------------|---------|-------------|
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true|
| encrypted_password | string  | null: false |
| family_name        | string  | null: false |
| first_name         | string  | null: false |
| family_name_kana   | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | date    | null: false |


### Association
・has_many :items
・has_many :purchases


## ITEMSテーブル

| Column           | Type       | Options     |
|------------------|------------|-------------|
| name             | string     | null: false |
| text             | text       | null: false |
| category_id      | integer    | null: false |
| status_id        | integer    | null: false |
| shopping_cost_id | integer    | null: false |
| area_id          | integer    | null: false |
| shopping_day_id  | integer    | null: false |
| price            | integer    | null: false |
| user             | references | null: false, foreign_key: true |

### Association
・belongs_to :user
・has_one    :purchase
・belongs_to :category
・belongs_to :status
・belongs_to :shopping_cost
・belongs_to :area
・belongs_to :shopping_day


## ADDRESSESテーブル

| Column      | Type       | Options     |
|-------------|------------|-------------|
| postal_code | string     | null: false |
| area_id     | integer    | null: false, foreign_key: true |
| city        | string     | null: false |
| address     | string     | null: false |
| building    | string     |             |
| phone_num   | string     | null: false |
| purchase    | references | null: false, foreign_key: true |


### Association
・belongs_to :purchase


## PURCHASESテーブル

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
・belongs_to :item
・has_one    :address
・belongs_to :user


## CATEGORYテーブル
・ActiveHash

### Association
・has_many :items


## STATUSテーブル
・ActiveHash

### Association
・has_many :items


## SHOPPING_COSTテーブル
・ActiveHash

### Association
・has_many :items


## AREAテーブル
・ActiveHash

### Association
・has_many :items


## SHOPPING_DAYテーブル
・ActiveHash

### Association
・has_many :items