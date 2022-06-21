import 'package:flutter_app/models/catalog.dart';

class CartModel{

  // Catalog field
  CatalogModel _catalog;

  //Collection of IDs - Store IDs of each item
  final List<int> _itemIds = [];

  //Get Catalog
  CatalogModel get catalog => _catalog;

  //Set Catalog
  set catalog(CatalogModel newCatalog){
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //Get items in the Cart
  List<Item> get items => _itemIds.map((id)=>_catalog.getById(id)).toList();

  //Get total Price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Add Item
  void add(Item item){
    _itemIds.add(item.id);
  }

  //Remove Item
  void remove(Item item){
    _itemIds.remove(item.id);
  }
}