
var $orders;

var fbroot = new Firebase('https://wt-online.firebaseio.com/');

$(function(){

  $orders = $('#orders');

  var orders = fbroot.child('orders');

  orders.once('value', function(snapshot) {
    $orders.empty();
    snapshot.forEach(addOrder);
  });

  orders.on('child_added', addOrder);

});

function addOrder(order) {
  order = order.val();
  $orders.append(
    '<li class="collection-item">' + 
      '<h5>' + order.name + '</h5>' +
      '<span>' + 
        order.kind + ' ' + order.food +
        (order.extras ? ' + ' + order.extras.join(', ') : '') +
      '</span>' +
    '</li>'
  );
}

// ref.child('email').orderByValue().on('value', function(snapshot) {
//   var emails = snapshot;
//   document.getElementById('emails').innerHTML = '';
//   snapshot.forEach(function(snapshot) {
//     emails = snapshot.val();
//     $('#emails').append('<li class='collection-item'>' + emails.email + '<br>' + '</li>');
//   });
// });