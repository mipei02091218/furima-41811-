# テーブル設計

## usersテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true |
| password           | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| bday_year          | integer | null: false |
| bday_month         | integer | null: false |
| bday_day           | integer | null: false |

### Association

has_many :items
has_many :orders

## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user               | references | null: false, foreign_key: true|
| name               | string     | null: false |
| description        | text       | null: false |
| category           | integer    | null: false |
| condition          | string     | null: false |
| shipping_from      | string     | null: false |
| shipping_fee       | string     | null: false |
| shipping_days      | integer    | null: false |
| price              | integer    | null: false |

### Association

has_one :order
belongs_to :user
has_one_attached :image

## ordersテーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| user                | references | null: false, foreign_key: true|
| item                | references | null: false, foreign_key: true|
| shipping_address    | references | null: false, foreign_key: true|
| total_price         | integer    | null: false |

### Association

belongs_to :user
belongs_to :item
has_one :shipping_address

## shipping_addresses テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| order               | references | null: false, foreign_key: true|
| postal_code         | integer    | null: false |
| prefecture          | string     | null: false |
| city                | string     | null: false |
| street              | string     | null: false |
| building            | string     |             |
| phone               | integer    | null: false |

### Association

belongs_to :order

