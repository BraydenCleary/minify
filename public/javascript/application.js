$(document).ready(function(){
  $('#home-form').submit(function(e) {
    e.preventDefault();
    debugger
    $.ajax({
      type: this.method
      url:  this.action
    })
  });
});
