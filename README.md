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

- has_many :items
- has_many :managements

## items テーブル

| Colum              | Type       | Options           |
| ------------------ | ---------- |------------------ |
| item_name          | string     | null: false       |
| explanation        | text       | null: false       |
| category_id        | integer    | null: false       |
| status_id          | integer    | null: false       |
| cost_id            | integer    | null: false       |
| prefecture_id      | integer    | null: false       |
| days_id            | integer    | null: false       |
| price              | integer    | null: false       |
| user               | references | null: false, foreign_key: true |

- belongs_to :user
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
| management       | references | null: false, foreign_key: true |

- belongs_to :management

## managements テーブル
| Colum            | Type       | Options           |
| ---------------- | ---------- |------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :order

