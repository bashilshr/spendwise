import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/category_model.dart';
import 'models/expense_model.dart';
import 'core/theme/app_themes.dart';
import 'core/theme/theme_provider.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(CategoryModelAdapter());
  Hive.registerAdapter(ExpenseModelAdapter());
  runApp(const ProviderScope(child: SpendWiseApp()));
}

class SpendWiseApp extends ConsumerWidget {
  const SpendWiseApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp(
      title: 'SpendWise',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      home: const ThemeTestScreen(),
    );
  }
}

class ThemeTestScreen extends ConsumerWidget {
  const ThemeTestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('SpendWise'),
        actions: [
          IconButton(
            icon: Icon(
              themeMode == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () {
              ref.read(themeProvider.notifier).state =
                  themeMode == ThemeMode.dark
                      ? ThemeMode.light
                      : ThemeMode.dark;
            },
          )
        ],
      ),
      body: const Center(
        child: Text(
          'Welcome to SpendWise🌱',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
