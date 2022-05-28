import 'package:flutter/material.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:flutter_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
               buttonPadding: EdgeInsets.zero,
              children: [
                Text("\$${catalog.price.toString()}",
                  textScaleFactor: 2.25,
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(onPressed: (){},
                    child: Text("Buy"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                      shape: MaterialStateProperty.all(StadiumBorder()),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
         bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.image)
              ).h32(context),
            ),
            Expanded(
                child: VxArc(
                  height: 30.0,
                  edge: VxEdge.TOP,
                  arcType: VxArcType.CONVEY,
                  child: Container(
                    color: Colors.white,
                    width: context.screenWidth,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 64.0),
                      child: Column(
                        children: [
                        Text(catalog.name,
                        textScaleFactor: 2.25,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: MyTheme.darkBluishColor,
                        ),
                      ),
                      // catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                          Text(catalog.desc,
                            textScaleFactor: 1.40,
                            style: Theme.of(context).textTheme.caption.merge(TextStyle(
                              fontWeight: FontWeight.w500
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
