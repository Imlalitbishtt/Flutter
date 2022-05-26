import 'dart:convert';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/catalog.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController controller;
  final int days = 30;
  final String name = "Mystical";

  @override
  void initState() {

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: true);
    super.initState();
    loadData();
  }

  loadData() async {
    await (Future.delayed(Duration(seconds: 5)));
   final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
   final decodedData = jsonDecode(catalogJson);
   var productsData = decodedData["products"];
   CatalogModel.items = List.from(productsData)
       .map((item)=> Item.fromMap(item))
       .toList();
      setState(() {
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 65.0),
          child: Text("Catalog App",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items!=null && CatalogModel.items.isNotEmpty) ? ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index)=> ItemWidget(
                item: CatalogModel.items[index],
          )
        )
          : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: CircularProgressIndicator(
                    color: Colors.greenAccent,
                     value: controller.value,
                     semanticsLabel: 'Linear Progress indicator',
                  ),
                ),

              Text("Loading",style: TextStyle(fontSize: 18),),
            ],
          )
      ),
      drawer: MyDrawer(),
    );
  }
}