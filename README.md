# テーブル設計 

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| profile            | text   | null: false |
| occupation         | text   | null: false |
| position           | text   | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

## association
- has_many :prototype_users
- has_many :prototypes, through: :prototype_users
- has_many :comments

## prototypesテーブル

| Column             | Type       | Options                        |
| ------------------ | -----------| -------------------------------|
| title              | string     | null: false                    |
| catch_copy         | text       | null: false                    |
| concept            | text       | null: false                    |
| user               | references | null: false, foreign_key: true |

## association

- has_many :prototype_users
- has_many :users, through: :prototype_users
- has_many :comments

## prototype_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :prototype
- belongs_to :user


# commentsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------------|
| text               | text       | null: false                    |
| user               | references | null: false, foreign_key: true |
| prototype          | references | null: false, foreign_key: true |

## association

- belongs_to :user
- belongs_to :prototype
