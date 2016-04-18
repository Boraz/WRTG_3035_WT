

$('select').material_select();

var $submit = $('#submit');
var $email = $('#email');
var $name = $('#nickname');
var $food = $('#food');

var fbroot = new Firebase('https://wt-online.firebaseio.com/');

var foods = fbroot.child('foods');
var food_data;

foods.once('value', function(snapshot){
  food_data = snapshot.val();
  for (var i = 0; i != food_data.length; ++i) {
    f = food_data[i];
    $food.append('<option data-icon="images/'+f.image+'">'+f.name+'</option>');
  }
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
