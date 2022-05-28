import 'package:flutter_app/pages/home_detail_page.dart';

import 'catalog_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:flutter_app/widgets/themes.dart';


// *******LIST VIEW********

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index){
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: ()=> Navigator.push(
              context, MaterialPageRoute(
              builder: (context) =>
                  HomeDetailPage(
                      catalog: catalog,
                  )
              )
          ),
            child: CatalogItem(catalog: catalog)
        );
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
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 0.0),
      child: VxBox(
          child: Row(
            children: [
              Hero(
                tag: Key(catalog.id.toString()),
                child: CatalogImage(
                    image: catalog.image
                ),
              ),
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
                      //catalog.desc.text.textStyle(context.captionStyle).make(),
                      Text(catalog.desc,
                        style: Theme.of(context).textTheme.caption.merge(TextStyle(
                            //overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w200,
                        ))
                      ),
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