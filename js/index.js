
var root = new Firebase('https://wt-online.firebaseio.com/');

var taskListRef = root.child('email');
  
$('#submit').click(function() {
  console.log('the submit button is clicked');
  var email = $('#email').val();
  var taskObject = {
    email: email
  }

  if (email == "") {
    alert("Invalid entry detected.");
    console.log("INVALID ENTRY");
    return;
  } else {
    var newTaskRef = taskListRef.push();
    newTaskRef.set(taskObject);
  }

  var first_n = $('#first_name').val();
  var taskObject = {
    email: first_name
  }

  if (first_name == "") {
    alert("Invalid entry detected.");
    console.log("INVALID ENTRY");
    return
  } else {
    var newTaskRef = taskListRef.push();
    newTaskRef.set(taskObject);
  }

  Materialize.toast('Your Order has been recieved!', 4000, 'rounded');
});

var ref = new Firebase('https://wt-online.firebaseio.com/');
ref.child('email').orderByValue().on('value', function(snapshot) {
  
  var emails = snapshot;
  document.getElementById("emails").innerHTML = "";

  snapshot.forEach(function(snapshot) {
    emails = snapshot.val();
    $('#emails').append('<li>' + emails.email + '</li>');
  });

});