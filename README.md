# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| kanzi-name         | string | null: false |
| katakana-name      | string | null: false |
| date-of-birth      | date   | null: false |


### Association

- has_many :items
- has_many :comments


## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| image        | text       | null: false                    |
| name         | string     | null: false                    |
| explanation  | text       | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :buyer


## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


## buyer テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


## address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| address | text       | null: false                    |
| buyer   | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer