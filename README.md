# README

# テーブル設計

## users テーブル

| Column          | Type    | Options                   |
| --------------- | ------- | ------------------------- |
| nickname        | string  | null: false, unique: true |
| email           | string  | null: false               |
| password        | string  | null: false               |
| last_name       | string  | null: false               |
| first_name      | string  | null: false               |
| ruby_last_name  | string  | null: false               |
| ruby_first_name | string  | null: false               |
| birth_year_id   | integer | null: false               |
| birth_month_id  | integer | null: false               |
| birth_date_id   | integer | null: false               | 

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| image       | string     | null: false                    |
| name        | string     | null: false                    |
| text        | string     | null: false                    |
| category_id | integer    | null: false                    |
| status_id   | integer    | null: false                    |
| fee_id      | integer    | null: false                    |
| location_id | integer    | null: false                    |
| duration_id | integer    | null: false                    |
| price       | integer    | null: false                    |
| user_id     | references | null: false, foreign_key: true | 

### Association

- has_one :order
- belongs_to :user

## orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| price       | integer    | null: false                    |
| user_id     | references | null: false, foreign_key: true |
| item_id     | references | null: false, foreign_key: true |

### Association

- has_one :buyer_address
- belongs_to :user
- belongs_to :item

## buyer_addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| house_number   | string     | null: false                    |
| building_name  | string     | null: false                    |
| phone_number   | string     | null: false                    |
| order_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :order
