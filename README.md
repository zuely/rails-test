# README

## Questions

- In file \_table-row.html.erb I can use "edit_article_path(article.id)" or "edit_article_path(article)" and both works. Is that expected?
- Same file, how can I add a confirmation box before deleting the item.
- The button_to generate a form and there is no way to control the style. For example, make it display: inline
- Is "rescue ActiveRecord::RecordNotFound" best way to manage?
- Why this route works "/articles.blasdfsdf" ? and why this one is a problem "/articles.json"? is it possible to disable the ".format"?
- "resources :articles" has too many definitions (as show, PATH, PUT), are you using it or do it manually?
- Default values for Models - check /articles/new
- When you show a partial like this: 
<%= render 'form', article: @article %>
The article part is not doing anything. I found the way to set params to partial is with "locals" but only works if set "render partial: 'form'"
- On form error, rails add div.field_with_errors to the dom breaking bootstrap. Is there a way to avoid it?
- On delete, I'm loosing the current page of the list. Which is the best way to avoid this problem?
- En el model, porque aca se usa "self.author ||= 'Unknown'" y en el resto no?
