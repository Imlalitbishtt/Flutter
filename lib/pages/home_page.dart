import 'package:flutter/material.dart';
import 'package:flutter_app/models/catalog.dart';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Mystical";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 65.0),
          child: Text("Catalog App",
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index){
              return ItemWidget(
                item: CatalogModel.items[index],);
            },
          ),
        )
      ),
      drawer: MyDrawer(),
    );
  }
}