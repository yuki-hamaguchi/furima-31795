# テーブル設計

## usersテーブル

| Column          | Type    | Options                   |
| --------------- | ------- | ------------------------- |
| nickname        | string  | null: false, unique: true |
| email           | string  | null: false, unique: true |
| password        | string  | null: false               |
| last_name       | string  | null: false               |
| first_name      | string  | null: false               |
| last_name_kana  | string  | null: false               |
| first_name_kana | string  | null: false               |
| user_birthday   | integer | null: false               |

### Association

- has_many :items

## itemsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| image     |            | null: false                    |
| item_name | string     | null: false                    |
| info      | text       | null: false                    |
| details   | string     | null: false                    |
| delivery  | string     | null: false                    |
| prise     | string     | null: false                    |
| user_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :orders

## ordersテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| card_number | integer    | null: false                    |
| items_id    | references | null: false, foreign_key: true |
| user_id     | references | null: false, foreign_key: true |

### Association

- has_many :orders
- has_one :shipping_address

## shipping_address

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | integer    | null: false                    |
| address      | string     | null: false                    |
| phone_number | integer    | null: false                    |
| item_id      | references | null: false, foreign_key: true |
| user_id      | references | null: false, foreign_key: true |

### Association

-belongs_to :orders