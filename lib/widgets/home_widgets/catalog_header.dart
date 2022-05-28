import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/themes.dart';


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