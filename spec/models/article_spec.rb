require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validations' do
    it 'validates presence of title' do
      article = Article.new(author: 'John Doe', body: 'Lorem ipsum')
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("can't be blank")
    end

    it 'validates presence of author' do
      article = Article.new(title: 'Test Title', author: '', body: 'Lorem ipsum')
      expect(article).not_to be_valid
      expect(article.errors[:author]).to include("can't be blank")
    end

    it 'validates presence of body' do
      article = Article.new(title: 'Test Title', author: 'John Doe')
      expect(article).not_to be_valid
      expect(article.errors[:body]).to include("can't be blank")
    end
  end

  describe 'default values' do
    it 'sets default value for author if not provided' do
      article = Article.new(title: 'Test Title', body: 'Lorem ipsum')
      expect(article.author).to eq('Unknown')
    end
  end

  describe 'custom validations' do
    it 'validates the length of body' do
      article = Article.new(title: 'Test Title', author: 'John Doe', body: 'Short')
      expect(article).not_to be_valid
      expect(article.errors[:body]).to include('is too short')
    end

    it 'does not add error if body length is sufficient' do
      article = Article.new(title: 'Test Title', author: 'John Doe', body: 'Long enough body')
      expect(article).to be_valid
    end
  end

  describe 'set url value' do
    it 'from title "Test Title"' do
      article = Article.create(title: 'Test Title', body: 'Lorem ipsum')
      expect(article.url).to eq('test-title')
    end

    it 'from title "Test---Title!!"' do
      article = Article.create(title: 'Test---Title!!', body: 'Lorem ipsum')
      expect(article.url).to eq('test-title')
    end

    it 'from title "%TestTitle%"' do
      article = Article.create(title: '%TestTitle%', body: 'Lorem ipsum')
      expect(article.url).to eq('testtitle')
    end

    it 'from title "   Test    Title   "' do
      article = Article.create(title: '   Test    Title   ', body: 'Lorem ipsum')
      expect(article.url).to eq('test-title')
    end
  end
end
