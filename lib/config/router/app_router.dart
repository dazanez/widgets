import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/routes/routes.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: Routes.root,
  routes: [
    GoRoute(
      path: Routes.root,
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: Routes.buttons,
      name: ButtonsScreen.name,
      builder: (context, state) => const ButtonsScreen(),
    ),
    GoRoute(
      path: Routes.cards,
      name: CardsScreen.name,
      builder: (context, state) => const CardsScreen(),
    ),
  ],
);