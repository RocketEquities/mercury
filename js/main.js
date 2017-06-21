$( document ).ready(function() {
  var $successModal = $("#register-success-modal");
  var $failModal = $("#register-fail-modal");

  $(".register").on("submit", function(e) {
    e.preventDefault();

    var register = $.ajax({
      url: "/register",
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