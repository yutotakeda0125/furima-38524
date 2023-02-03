## users テーブル

| Column             | Type   | Options    
| ------------------ | ------ | ------------------------|
| nickname           | string | null: false             |
| email              | string | null: false             |
| encrypted_password | string | null: false             |
| first_name         | string | null: false             |
| last_name          | string | null: false             |
|first_name_kana     | string | null: false             |
|last_name_kana      | string | null: false             |
|birthday            | date   | null: false             |

### Association
 has_many:items
 belongs_to:user
 has_many:orders
 belongs_to:user


## items テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | -------------------------------|
| name      | string     | null: false                    |
| description| text       | null: false                   |
| category_id| integer    | null: false                   |
| status_id. | integer     | null: false                  |
| shipping_cost_id.| integer | null: false                |
| shipping_date_id.| integer | null: false                |
|prefecture_id.| integer     | null: false                |
|price        | integer     | null: false                |
|user        | references     | null: false,foreign_key: true|

### Association
has_many:items
belongs_to:user
has_one:order
belongs_to:item

## orders テーブル

| Column  | Type       | Options                        |
| ------  | -----------| -------------------------------|
|item     | references | null: false, foreign_key: true |
|user     | references | null: false, foreign_key: true |

### Association
has_many:orders
belongs_to:user
has_one:order
belongs_to:item
belongs_to:order
has_one:payment

## payments テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ---------------------------|
| postcode  | string      | null: false               |
|prefecture_id.| integer  | null: false               |
|city       | string      | null: false               |
|block      | string      | null: false               |
|building    | string       |                         |
|phone_number    |string    |  null: false            |
|order    |references | null: false, foreign_key: true|

### Association
belongs_to:order
has_one:payment
