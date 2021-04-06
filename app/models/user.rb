class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :authentication_keys => [:employee_id_number]
  validates :employee_id_number, uniqueness: true


  def email_required?
    false
  end

  def email_changed?
    false
  end
end
