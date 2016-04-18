

$('select').material_select();

var $submit = $('#submit');
var $email = $('#email');
var $name = $('#nickname');
var $food = $('#food');

var fbroot = new Firebase('https://wt-online.firebaseio.com/');

var foods = fbroot.child('foods');

foods.once('value', function(snapshot){
  snapshot.forEach(function(f){
    f = f.val();
    $food.append('<option data-icon="images/'+f.image+'">'+f.name+'</option>');
  });
  $food.material_select();
});

// var taskListRef = root.child('email');

// $submit.click(function() {
//   console.log('the submit button is clicked');
//   var email = $email.val();

//   var taskObject = {
//     email: email
//   }

//   if (email == '') {
//     alert('Invalid entry detected.');
//     console.log('INVALID ENTRY');
//     return;
//   } else {
//     var newTaskRef = taskListRef.push();
//     newTaskRef.set(taskObject);
//   }

//   var name = $name.val();
//   var taskObject = {
//     email: name
//   }

//   if (name == '') {
//     alert('Invalid entry detected.');
//     console.log('INVALID ENTRY');
//     return
//   } else {
//     var newTaskRef = taskListRef.push();
//     newTaskRef.set(taskObject);
//   }

//   Materialize.toast('Your Order has been recieved!', 4000, 'rounded');
// });
