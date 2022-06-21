import 'package:flutter/material.dart';
import 'package:flutter_app/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: Text("cart"),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}


  class _CartTotal extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      final CartModel _cart = (VxState.store as MyStore).cart;
      return SizedBox(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("\$${_cart.totalPrice}",
              textScaleFactor: 2.25,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              width: 30,
            ),
            ElevatedButton(
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Order Placed Successfully")
                  ));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).focusColor)
                ),
                child: Text("Buy",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),)
            ),
          ],
        ),
      );
    }
  }

    class _CartList extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      final CartModel _cart = (VxState.store as MyStore).cart;
      return _cart.items.isEmpty? Center(child: Text("Your Cart is Empty", textScaleFactor: 1.8,style: TextStyle(),)):
      ListView.builder(
          itemCount: _cart.items?.length,
          itemBuilder: (context, index) => ListTile(
            leading: Icon(Icons.done),
            trailing: IconButton(
              icon: Icon(Icons.remove),
              onPressed: (){
                _cart.remove(_cart.items[index]);
                //setState(() {});
              },
            ),
            title: Text(_cart.items[index].name),
          ),
      );
    }
  }
  
  
  