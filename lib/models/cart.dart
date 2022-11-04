import 'package:flutter_catalog/models/catalog.dart';

class CartModel {
  // catalog field
  CatalogModel _catalog;
  // Collection of IDs -store IDs of each item
  final List<int> _itemIDS = [];
  // get Catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Item> get items => _itemIDS.map((id) => _catalog.getById(id)).toList();
  // get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
  // Add Item
  void add(Item item) {
    _itemIDS.add(item.id);
  }

  // Remove Item
  void remove(Item item) {
    _itemIDS.remove(item.id);
  }
}
