import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (_) => ThemeProvider(), child: const MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Widgets App',
      debugShowCheckedModeBanner: false,
      theme: themeProvider.themeData,
      darkTheme: themeProvider.darkThemeData,
      themeMode: themeProvider.themeMode,
    );
  }
}
