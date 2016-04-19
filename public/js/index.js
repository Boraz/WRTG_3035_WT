
var $email,
    $name,
    $food,
    $foodType, 
    $foodExtras,
    $submit
;

var fbroot = new Firebase('https://wt-online.firebaseio.com/');

var orders = fbroot.child('orders');
var foods = fbroot.child('foods');
var food_data;

$(function(){

  $submit = $('#submit');
  $email = $('#email');
  $name = $('#name');
  $food = $('#food');
  $foodType = $("#food-type");
  $foodExtras = $("#food-extras");

  $('select').material_select();

  loadFoods();

  $food.change(function(evt) {
    var val = $food.val();
    loadOptions(food_data[val]);
  });

  $submit.click(function(){
    var name = $name.val();
    var email = $email.val();
    var food = food_data[$food.val()];
    var kind = food ? food.kinds[$foodType.val()] : undefined;
    var extras = $foodExtras.val();

    if (name && email && food && kind) {
      orders.push({
        "name": name,
        "email": email,
        "food": food.name,
        "kind": kind,
        "extras": extras
      });
      reset();
      Materialize.toast("Order submitted.");
    } else {
      Materialize.toast("Invalid order.");
    }

  });

});

function loadFoods() {
  $food.empty();
  $food.append('<option value="" disabled selected>Choose a food</option>');
  foods.once('value', function(snapshot){
    food_data = snapshot.val();
    for (var i = 0; i != food_data.length; ++i) {
      f = food_data[i];
      $food.append('<option value="'+i+'" data-icon="images/'+f.image+'">'+f.name+'</option>');
    }
    $food.material_select();
  });
}

function loadOptions(food) {
  $foodType.empty();
  $foodType.append('<option value="" disabled selected>Choose Type</option>');
  for (var i = 0; food && food.kinds && i != food.kinds.length; ++i) {
    $foodType.append('<option value="'+i+'">'+food.kinds[i]+'</option>');
  }

  $foodExtras.empty();
  $foodExtras.append('<option value="" disabled selected>Choose Extras</option>');
  for (var i = 0; food && food.extras && i != food.extras.length; ++i) {
    $foodExtras.append('<option value="'+food.extras[i]+'">'+food.extras[i]+'</option>');
  }

  $foodType.material_select();
  $foodExtras.material_select();
}

function reset() {
  loadFoods();
  loadOptions();
}
