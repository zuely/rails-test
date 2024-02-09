class Article < ApplicationRecord
  after_initialize :set_default_value

  validates :title, presence: true
  validates :author, presence: true
  validates :body, presence: true
  validate :validate_model

  private

  def set_default_value
    self.author ||= 'Unknown'
  end

  def validate_model
    return if !body.nil? && body.size > 5

    errors.add :body, 'is too short'
  end
end
