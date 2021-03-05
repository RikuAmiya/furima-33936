# アプリケーション情報

## アプリケーション概要
・フリーマーケットアプリケーション
### 接続先情報
・https://furima-33936.herokuapp.com/
・ID：amiya
・PASS：1005
## テストアカウント用
・・購入者用
・メールアドレス: test1@example
・パスワード: test10000
・・購入用カード情報
・番号：4242424242424242
・期限：2/24
・セキュリティコード：123
・・出品者用
・メールアドレス名: test2@example
・パスワード: test20000

## 開発状況
### 開発環境
・Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code
### 開発期間と平均作業時間
・開発期間：2/8~2/26(18日間)
・1日あたりの平均作業時間：約11時間
・合計：約200時間

### 動作確認方法
・WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。
・ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
・接続先およびログイン情報については、上記の通りです。
・同時に複数の方がログインしている場合に、ログインできない可能性があります。
・テストアカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品出品
・確認後、ログアウト処理をお願いします。

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