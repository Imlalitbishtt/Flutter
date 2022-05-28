import 'package:flutter/material.dart';


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
            color: Theme.of(context).primaryColor,
          ),
        ),
        Text("Trending Products",
          textScaleFactor: 1.5,
          style: TextStyle(
              color: Theme.of(context).primaryColor
          ),
        ),
      ],
    );
  }
}