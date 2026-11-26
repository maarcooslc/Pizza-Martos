import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kebab_app/models/product_model.dart';
import 'package:kebab_app/services/product_service.dart';

class ProductScreen extends StatelessWidget {
  final Producto producto;
  const ProductScreen({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    //Recuperamos el producto que nos pasan como argumento en la llamada
    //A esta screen
    return Scaffold(
      appBar: AppBar(title: Text(producto.nombre)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(producto.img),
            SizedBox(height: 40),

            Text(
              producto.nombre,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            Text(
              '${producto.precio}€',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              producto.descripcion,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 100),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.grey[200],
                    child: Row(
                      children: [
                        Icon(Icons.remove),
                        SizedBox(width: 15),
                        Text('1'),
                        SizedBox(width: 15),
                        Icon(Icons.add),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 100),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: FilledButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Eliminar producto'),
                      content: Text(
                        'Si elimina el producto no se podrá recuperar',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () async {
                            await ProductService.deleteProduct(producto.id!);
                            context.pushReplacement('/');
                          },
                          child: Text('Aceptar'),
                        ),
                      ],
                    ),
                  );
                },
                label: Text('Borrar'),
                icon: Icon(Icons.delete),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 216, 60, 60),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushReplacement('/');
        },
        child: Icon(Icons.arrow_back_ios),
      ),
    );
  }
}
