
var $orders;

var fbroot = new Firebase('https://wt-online.firebaseio.com/');
var orders;

$(function(){

  $orders = $('#orders');

  orders = fbroot.child('orders');

  orders.on('value', function(snapshot) { /* orders.on for real time changes to the orders page */
    $orders.empty();
    snapshot.forEach(addOrder);
  });

  orders.on('child_added', addOrder);

});

function addOrder(order) {
  order_data = order.val();
  
  var $newItem = $(
    '<li class="collection-item row valign-wrapper">' + 
      '<div class="col s10">' +
        '<h5>' + order_data.name + '</h5>' +
        '<span>' + (order_data.extras ? ' ' + order_data.extras.join(', ') : '') + ' ' +
          order_data.kind + ' ' + order_data.food +
        '</span>' +
      '</div>' +
    '</li>'
  );

  var $remove = $(
    '<a class="waves-effect waves-light btn valign center-align red accent-4 z-depth-2 col s1"><i class="material-icons">done</i></a>'
  );
  $remove.attr('key', order.key());

  $newItem.prepend($remove);
  $orders.append($newItem);

  $remove.click(removeOrder);

}

function removeOrder(order) {
  var toDelete = $(this).attr('key');
  setTimeout(function(){
      orders.child(toDelete).set(null);
  }, 100);
}