$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('form.delete_form').submit(function(event) {
    event.preventDefault();
    var $target = $(event.target);
    $target.find("input[type=submit]").val("Deleting...");

    $.ajax({
      type: "DELETE",
      url: $target.attr("action"),
      data: {hello: "value"}
    }).done(function(response) {
      console.log(response);
      $target.parent().remove();
    })

    console.log("Hello from delete form handler.")
  });
});
