var textareas = document.querySelectorAll('textarea');
textareas.forEach(function (textarea) {
  if (textarea.attributes.tinymce) {
    tinymce.init({
      selector: '#' + textarea.id,
    });
  }
});
