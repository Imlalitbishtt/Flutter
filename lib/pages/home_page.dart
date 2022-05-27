import 'dart:convert';
import 'package:flutter_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
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
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                Center(
                  child:CircularProgressIndicator(),
                )
            ],
          ),
        ),
      )
    );
  }
}

//*******CATALOG HEADER*******
class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Catalog App",textScaleFactor: 3,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: MyTheme.darkBluishColor,
          ),
        ),
        Text("Trending Products",
          textScaleFactor: 1.5,
        ),
      ],
    );
  }
}



// *******LIST VIEW********
class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
    itemCount: CatalogModel.items.length,
        itemBuilder: (context, index){
          final catalog = CatalogModel.items[index];
          return CatalogItem(catalog: catalog);
          },
        );
  }
}


//*********CatalogItem*********
class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key key, @required this.catalog})
      : assert(catalog!=null),
          super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: VxBox(
        child: Row(
          children: [
            CatalogImage(image: catalog.image),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(catalog.name,
                  textScaleFactor: 1.125,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyTheme.darkBluishColor,
                  ),
                ),
                catalog.desc.text.textStyle(context.captionStyle).make(),
                SizedBox(
                  height: 10,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    Text("\$${catalog.price.toString()}",
                      textScaleFactor: 1.25,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ElevatedButton(onPressed: (){},
                          child: Text("Buy"),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                          shape: MaterialStateProperty.all(StadiumBorder()),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ))
          ],
        )
      ).rounded.white.square(150).make(),
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

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key key,@required this.image})
      : assert(image !=null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p8.color(MyTheme.creamColor).make().p16().w40(context);
  }
}
