import 'package:docu/screens/home_screen.dart';
import 'package:docu/theme/app_theme.dart';
import 'package:docu/utils/app_state.dart';
import 'package:docu/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefUtils.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, appstate, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PDF Reader',
        theme: appstate.isDarkMode ? darkTheme : lightTheme,
        home: const HomeScreen(),
      );
    });
  }
}
