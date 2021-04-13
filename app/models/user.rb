class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
   :recoverable, :rememberable, :validatable,
   :authentication_keys => [:employee_id_number]
  
  with_options presence: true do
  validates :employee_id_number, uniqueness: true, length: { maximum: 5 },
  format: { with: /\A\d{,5}\z/, message: ' 5桁以下で登録してください' }
 
  validates :name_kana,
  format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カナで登録してください' } 

  validates :name,
  format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角で登録してください' } 
  
  validates :password,
  format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{8,}\z/, message: '半角英数字8文字以上で入力してください' }
  end

  has_many :tweets
  
  def email_required?
    false
  end
  
  def email_changed?
    false
  end

end
