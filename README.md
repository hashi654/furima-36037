# テーブル設計

## users テーブル

| Colum              | Type     | Options     |
| ------------------ | -------- |------------ |
| nickname           | string   | null: false |
| email              | string   | null: false |
| encrypted_password | string   | null: false |
| last_name          | string   | null: false |
| first_name         | string   | null: false |
| kana_last_name     | string   | null: false |
| kana_first_name    | string   | null: false |
| birthday           | datetime | null: false |

- has_many :items
- has_many :orders

## items テーブル

| Colum           | Type       | Options           |
| --------------- | ---------- |------------------ |
| image           |            |                   |
| item_name       | string     | null: false       |
| explanation     | text       | null: false       |
| category        | string     | null: false       |
| status          | string     | null: false       |
| shipping_charge | string     | null: false       |
| shipment_source | string     | null: false       |
| days_to_ship    | string     | null: false       |
| price           | integer    | null: false       |
| user_id         | references | foreign_key: true |


- belongs_to :user
- has_one :order

## orders テーブル

| Colum            | Type       | Options           |
| ---------------- | ---------- |------------------ |
| credit_card      | integer    | null: false       |
| date_of_expiry   | integer    | null: false       |
| security_code    | integer    | null: false       |
| postal_code      | integer    | null: false       |
| prefecture       | string     | null: false       |
| municipality     | string     | null: false       |
| address          | string     | null: false       |
| building         | string     |                   |
| telephone_number | integer    | null: false       |
| user_id          | references | foreign_key: true |
| item_id          | references | foreign_key: true |

- belongs_to :user
- belongs_to :item