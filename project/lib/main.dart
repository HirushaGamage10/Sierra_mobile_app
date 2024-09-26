import 'screens/start_page.dart';
import 'screens/guest_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'package:provider/provider.dart';
import 'widgets/theme_notifier.dart';
import 'screens/login_page.dart';
import 'widgets/navigation_bar.dart';

void main() {
  
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(
      ChangeNotifierProvider(
        create: (_) => ThemeNotifier(),
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeNotifier.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          initialRoute: '/',
          routes: {
            '/': (context) => StartPage(toggleDarkMode: (bool value) {
              themeNotifier.toggleDarkMode(value);
            }, isDarkMode: themeNotifier.isDarkMode),
            '/guest': (context) => GuestPage(),
            '/login': (context) => LoginPage(),
            '/home': (context) => MainPage(toggleDarkMode: (bool value) {
              themeNotifier.toggleDarkMode(value);
            }, isDarkMode: themeNotifier.isDarkMode),
          },
        );
      },
    );
  }
}
