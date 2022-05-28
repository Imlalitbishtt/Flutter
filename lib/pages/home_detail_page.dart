import 'package:flutter/material.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      bottomNavigationBar: Container(
        color: Theme.of(context).cardColor,
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
                    color: Theme.of(context).focusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 120,
                  height: 50,
                  child: ElevatedButton(onPressed: (){},
                    child: Text("Add to cart"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Theme.of(context).focusColor,),
                      shape: MaterialStateProperty.all(StadiumBorder()),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
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
                    color: Theme.of(context).cardColor,
                    width: context.screenWidth,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 64.0),
                      child: Column(
                        children: [
                        Text(catalog.name,
                        textScaleFactor: 2.25,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      // catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                          Text(catalog.desc,
                            textScaleFactor: 1.40,
                            style: Theme.of(context).textTheme.caption.merge(TextStyle(
                             // fontWeight: FontWeight.w500
                              color: Theme.of(context).primaryColor,
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "Lorem ipsum dolor sit amet,inus ex doloribus yu ui tempora nostrum quam enim quis! Corporis xahi expedita autem sit, lorem ipsum dispum distinctio maiores officia late yu laborum sed eum ipsum dicta porro est totam. "
                                  "lorem ipsum dispum zora tashe quira huiyate liszi adios buenas dias",
                              style: Theme.of(context).textTheme.caption.merge(TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
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
