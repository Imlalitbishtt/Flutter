import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/themes.dart';

class CartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("cart"),
      ),
      backgroundColor: MyTheme.creamColor,
    );
  }
}
