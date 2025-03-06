# テーブル設計

## usersテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | date    | null: false |


### Association

-has_many :items
-has_many :orders

## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user               | references | null: false, foreign_key: true|
| name               | string     | null: false |
| description        | text       | null: false |
| category_id        | integer    | null: false |
| condition_id       | integer    | null: false |
| prefecture_id      | integer    | null: false |
| shipping_fee_id    | integer    | null: false |
| shipping_day_id    | integer    | null: false |
| price              | integer    | null: false |

### Association

-has_one :order
-belongs_to :user
-has_one_attached :image

## ordersテーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| user                | references | null: false, foreign_key: true|
| item                | references | null: false, foreign_key: true|

### Association

-belongs_to :user
-belongs_to :item
-has_one :shipping_address

## shipping_addresses テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| order               | references | null: false, foreign_key: true|
| postal_code         | string     | null: false |
| prefecture_id       | integer    | null: false |
| city                | string     | null: false |
| street              | string     | null: false |
| building            | string     |             |
| phone               | string     | null: false |

### Association

-belongs_to :order

