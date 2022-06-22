import 'package:flutter_app/core/store.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

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

}

class AddMutation extends VxMutation <MyStore> {
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation <MyStore> {
  final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    store.cart._itemIds.remove(item.id);
  }
}