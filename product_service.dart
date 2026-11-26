import 'dart:convert';

import 'package:http/http.dart';
import 'package:kebab_app/models/product_model.dart';

class ProductService {
  static final String _URL =
      'https://pizzamartos-5049b-default-rtdb.europe-west1.firebasedatabase.app/productos';

  static Future<List<Producto>> getProducts() async {
    List<Producto> productos = [];
    Response response = await get(Uri.parse('$_URL.json'));

    if (response.statusCode != 200) return productos;

    Map<String, dynamic> mapaProductos = jsonDecode(response.body);
    mapaProductos.forEach((key, value) {
      Producto productTemp = Producto.fromJson(value);
      productTemp.id = key;
      productos.add(productTemp);
    });

    return productos;
  }

  static Future<bool> deleteProduct(String id) async {
    Response response = await delete(Uri.parse('$_URL/$id.json'));

    if (response.statusCode != 200) return false;
    return true;
  }
}
