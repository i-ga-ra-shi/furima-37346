# テーブル設計

## users テーブル

| Column             | Type   | Options                       |
| ------------------ | ------ | ----------------------------- |
| nickname           | string | null: false                   |
| email              | string | null: false, uniqueness: true |
| encrypted_password | string | null: false                   |
| kanzi_last_name    | string | null: false                   |
| kanzi_first_name   | string | null: false                   |
| kana_last_name     | string | null: false                   |
| kana_family_name   | string | null: false                   |
| date_of_birth      | date   | null: false                   |


### Association

- has_many :items
- has_many :comments
- has_many :purchases


## items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| name                  | string     | null: false                    |
| explanation           | text       | null: false                    |
| category_id           | string     | null: false                    |
| condition_id          | string     | null: false                    |
| delively_charge_id    | string     | null: false                    |
| sender_prefectures_id | string     | null: false                    |
| days_for_send_id      | string     | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchase


## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefectures_id | string     | null: false                    |
| cities         | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase