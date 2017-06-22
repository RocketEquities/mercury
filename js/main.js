$( document ).ready(function() {
  var $successModal = $("#register-success-modal");
  var $failModal = $("#register-fail-modal");

  $(".register").on("submit", function(e) {
    e.preventDefault();

    var register = $.ajax({
      url: "http://ec2-54-255-250-104.ap-southeast-1.compute.amazonaws.com:8000/v1/signups",
      method: "POST",
      contentType: "application/json",
      data: $(this).serialize()
    });

    register.done(function() {
      $successModal.modal("show");
    });

    register.fail(function() {
      $failModal.modal("show");
    })

  });
});