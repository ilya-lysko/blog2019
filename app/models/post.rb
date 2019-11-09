class Post < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  validates :title, presence: true, length: {maximum: 200}

  def edit_by?(current_user)
    current_user == self || current_user&.admin?
  end

end
