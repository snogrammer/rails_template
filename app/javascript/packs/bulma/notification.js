// https://bulma.io/documentation/elements/notification/#javascript-example
// document.addEventListener('DOMContentLoaded', () => {
//   (document.querySelectorAll('.notification .delete') || []).forEach(($delete) => {
//     $notification = $delete.parentNode;
//
//     $delete.addEventListener('click', () => {
//       $notification.parentNode.removeChild($notification);
//     });
//   });
// });

$(function(){
  $('.notification .delete').on('click', function(){
    $(this).parent().hide();
  });
});
