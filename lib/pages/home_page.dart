import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_app/widgets/themes.dart';
import 'package:flutter_app/models/catalog.dart';

import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController controller;

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
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 32,horizontal: 22),
          //padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                  CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      )
    );
  }
}



// Padding(
//   padding: const EdgeInsets.all(16.0),
//   child: Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.all(Radius.circular(10)),
//       color: MyTheme.creamColor,
//     ),
//     padding: EdgeInsets.all(8),
//       child: Image.network(catalog.image),
//   ).w40(context),
// ),


