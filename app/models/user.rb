class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #has_many :items
  #has_many :orders
  
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  NAME_REGEX_KANA = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
      validates :nickname, uniqueness: true
      validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/}
    with_options NAME_REGEX do
      validates :last_name
      validates :first_name
    end
    with_options NAME_REGEX_KANA do
      validates :last_name_kana
      validates :first_name_kana
    end
      validates :birth_date
  end
 
end
