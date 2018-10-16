$(document).on('turbolinks:load', function() {
  var fileField = $('.jsFileField');

  $('.jsDownloadBtn').on('click', function(e) {
    e.preventDefault();
    fileField.click();
  });

  fileField.on('change', function() {
    if(fileField.val()){
      fileField.closest('form').submit();
    }
  })
});
