class Producto {
  late final String? id;
  final String descripcion;
  final String nombre;
  final double precio;
  final String img;

  Producto({
    required this.descripcion,
    required this.nombre,
    required this.precio,
    required this.img,
  });

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
    descripcion: json["descripcion"],
    nombre: json["nombre"],
    precio: json["precio"]?.toDouble(),
    img: json["img"],
  );

  Map<String, dynamic> toJson() => {
    "descripcion": descripcion,
    "nombre": nombre,
    "precio": precio,
    "img": img,
  };
}
