require 'rails_helper'

RSpec.describe 'articles/show', type: :view do
  before(:each) do
    assign(:article, Article.create!(
                       title: 'Title',
                       author: 'Author',
                       body: 'MyText'
                     ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/MyText/)
  end
end
