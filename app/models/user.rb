class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :kanzi_last_name, :kanzi_first_name, :kana_last_name, :kana_first_name, :date_of_birth, presence:true

end
