class Article < ApplicationRecord
  after_initialize :set_default_value
  before_save :set_url

  validates :title, presence: true
  validates :author, presence: true
  validates :body, presence: true
  validate :validate_model

  def generate_url_from_title
    title.downcase
         .gsub(' ', '-') # Replace spaces for -
         .gsub(/[^a-z0-9-]/, '') # Ignore any character that is not a letter or a number
         .gsub(/-{2,}/, '-') # Replace multiple consecutive hyphens with a single hyphen
         .gsub(/\A-+|-+\z/, '') # Remove extra hyphen at the begging and at the end
  end

  private

  def set_default_value
    self.author ||= 'Unknown'
    self.url ||= generate_url_from_title
  end

  def set_url
    self.url = generate_url_from_title
  end

  def validate_model
    return if !body.nil? && body.size > 5

    errors.add :body, 'is too short'
  end
end
