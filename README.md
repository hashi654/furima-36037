# テーブル設計

## users テーブル

| Colum              | Type     | Options     |
| ------------------ | -------- |------------ |
| nickname           | string   | null: false |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false |
| last_name          | string   | null: false |
| first_name         | string   | null: false |
| kana_last_name     | string   | null: false |
| kana_first_name    | string   | null: false |
| birthday           | date     | null: false |

- has_many :managements

## items テーブル

| Colum              | Type       | Options           |
| ------------------ | ---------- |------------------ |
| item_name          | string     | null: false       |
| explanation        | text       | null: false       |
| category_id        | integer    | null: false       |
| status_id          | integer    | null: false       |
| shipping_charge_id | integer    | null: false       |
| prefecture_id      | integer    | null: false       |
| days_to_ship_id    | integer    | null: false       |
| price              | integer    | null: false       |
| user               | references | foreign_key: true |


- has_one :management

## orders テーブル

| Colum            | Type       | Options           |
| ---------------- | ---------  |------------------ |
| postal_code      | string     | null: false       |
| prefecture_id    | integer    | null: false       |
| municipality     | string     | null: false       |
| address          | string     | null: false       |
| building         | string     |                   |
| telephone_number | string     | null: false       |
| management       | references | foreign_key: true |

- has_one :management

## management テーブル
| Colum            | Type       | Options           |
| ---------------- | ---------- |------------------ |
| user             | references | foreign_key: true |
| item             | references | foreign_key: true |

- belongs_to :user
- belongs_to :item
- belongs_to :order

