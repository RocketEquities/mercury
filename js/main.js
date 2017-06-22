$( document ).ready(function() {
  var $successModal = $("#register-success-modal");
  var $failModal = $("#register-fail-modal");

  $(".register").on("submit", function(e) {
    e.preventDefault();

    var email = $(this).find(".email").val();
    if(!email) {
      $failModal.modal("show");
      return;
    }

    var register = $.ajax({
      url: "http://ec2-54-255-250-104.ap-southeast-1.compute.amazonaws.com:8000/v1/signups",
      type: "POST",
      data: {
        email: email
      }
    });

    register.done(function(payload) {
      if (payload.data) {
        $successModal.modal("show");  
        return;
      }

      $failModal.modal("show");
      
    });

    register.fail(function() {
      $failModal.modal("show");
    })

  });
});