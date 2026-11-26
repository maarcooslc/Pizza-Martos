import 'package:go_router/go_router.dart';
import 'package:kebab_app/models/product_model.dart';
import 'package:kebab_app/ui/screens/home_screen.dart';
import 'package:kebab_app/ui/screens/product_detail.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/product',
      builder: (context, state) {
        final Producto producto = state.extra! as Producto;
        return ProductScreen(producto: producto);
      },
    ),
  ],
);
