
var $orders;

var fbroot = new Firebase('https://wt-online.firebaseio.com/');

$(function(){

  $orders = $('#orders');

  var orders = fbroot.child('orders');

  orders.on('value', function(snapshot) { /* orders.on for real time changes to the orders page */
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
/*
function removeOrder(order) {
  complete.click(function(){
  if (least(time) {
    orders.remove({
    });
    reset();
    Materialize.toast("Order Completed.", 10000); /* changed to 10 seconds
  } else {
    Materialize.toast("No orders to complete.");
  }
});
}
*/