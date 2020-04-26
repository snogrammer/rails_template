# frozen_string_literal: true

class User < ApplicationRecord
  acts_as_paranoid

  before

  # Include default devise modules. Others available are:
  #  :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  validates :username, uniqueness: true
  validates :email, presence: true, email_format: { message: 'format is not valid' }

  before_validation :set_username, on: :create

  private

  def set_username
    return if username.present?

    self.username = Digest::MD5.hexdigest(Time.now.to_f.to_s + email)
  end
end
