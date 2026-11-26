import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kebab_app/models/product_model.dart';
import 'package:kebab_app/services/product_service.dart';

class HomeScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pizza Martos')),
      body: Center(
        child: FutureBuilder(
          future: ProductService.getProducts(),
          builder: (context, AsyncSnapshot<List<Producto>> snapshot) {
            return (snapshot.hasData)
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        ...snapshot.data!.map(
                          (producto) => _CardProduct(producto: producto),
                        ),
                      ],
                    ),
                  )
                : CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class _CardProduct extends StatelessWidget {
  final Producto producto;
  const _CardProduct({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    //En este sitio recupero los datos del tema o del tamaño de la pantalla
    final double anchoPantalla = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 250,
      width: anchoPantalla * 0.9,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: GestureDetector(
          onTap: () {
            context.pushReplacement('/product',extra: producto);
          },
          child: Card(
            child: Column(
              children: [
                FadeInImage(
                  placeholder: AssetImage('assets/img/blur_img.jpg'),
                  height: 180,
                  fit: BoxFit.cover,
                  image: NetworkImage(producto.img),
                ),
                SizedBox(height: 20),
                Text(
                  producto.nombre,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
