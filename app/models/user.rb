class User < ApplicationRecord
  has_secure_password
  has_many :posts
  validates :login, presence: true, uniqueness: true, length: {minimum: 3, maximum: 72}

  def edit_by?(current_user)
    # !current_user.nil? && (current_user == self || current_user.admin?)
    current_user == self || current_user&.admin?
  end
end
