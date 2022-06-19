import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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
      return SizedBox(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("\$9999",
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
  
  
  class _CartList extends StatefulWidget {
    @override
    State<_CartList> createState() => _CartListState();
  }
  
  class _CartListState extends State<_CartList> {
    @override
    Widget build(BuildContext context) {
      return ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => ListTile(
            leading: Icon(Icons.done),
            trailing: IconButton(
              icon: Icon(Icons.remove),
              onPressed: (){},
            ),
            title: Text("Item  1"),
          ),
      );
    }
  }
  
  
  