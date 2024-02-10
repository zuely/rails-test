document.getElementById('form-pagination-display-items_per_page').addEventListener('change', function () {
  console.log('on change display', this.value);
  document.getElementById('form-pagination-display').submit();
});
