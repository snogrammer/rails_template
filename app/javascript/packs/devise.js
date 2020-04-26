$(function() {
  $('#registration-edit-password-button').on('click', function(){
    $('#registrations-edit-update-password').toggleClass('is-active');
    return false;
  });

  $('#registration-edit-account-delete-button').on('click', function(){
    $('#registration-edit-account-delete').toggleClass('is-active');
    return false;
  });
});
