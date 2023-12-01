class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :user
  has_one_attached :introduction


  validates :name, uniqueness: true,length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }



  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
end
