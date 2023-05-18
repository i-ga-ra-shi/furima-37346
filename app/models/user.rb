class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  validates :nickname, :kanji_last_name, :kanji_first_name, :kana_last_name, :kana_first_name, :date_of_birth, presence: true
  validates :password,
            format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'is invalid. Include both letters and numbers' }
  validates :kanji_last_name, :kanji_first_name,
            format: { with: /\A[ぁ-んァ-ヶー一-龠々]+\z/, message: 'is invalid. Input full-width characters' }
  validates :kana_last_name, :kana_first_name,
            format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters' }
end
