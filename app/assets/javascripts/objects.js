$(document).ready(function() {
  $(".download-object").bind('ajax:complete', function() {
    alert("complete");
  });
});
