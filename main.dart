import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'leaderboard_screen.dart';
import 'rules_screen.dart';
import 'admin_panel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Color(0xFF0A0A0F),
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  runApp(const Al90App());
}

class Al90App extends StatelessWidget {
  const Al90App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'الـ 90',
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar'), Locale('en')],
      theme: _buildTheme(),
      initialRoute: '/',
      routes: {
        '/': (_) => const AppEntry(),
        '/leaderboard': (_) => const LeaderboardScreen(),
        '/rules'      : (_) => const RulesScreen(),
        '/admin'      : (_) => const AdminPanelScreen(),
      },
    );
  }

  ThemeData _buildTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF0A0A0F),
      primaryColor: const Color(0xFFD4AF37),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFD4AF37),
        secondary: Color(0xFFB8860B),
        surface: Color(0xFF12121A),
        onPrimary: Color(0xFF0A0A0F),
        onSurface: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xFFD4AF37)),
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFD4AF37)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFD4AF37),
          foregroundColor: const Color(0xFF0A0A0F),
          textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 0,
        ),
      ),
    );
  }
}

class AppEntry extends StatelessWidget {
  const AppEntry({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'label': '🏆  لوحة متصدري النمور', 'route': '/leaderboard'},
      {'label': '⚖️  دستور وقوانين المسابقة', 'route': '/rules'},
      {'label': '🛡️  بوابة الإدارة والمشرفين', 'route': '/admin'},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      appBar: AppBar(
        title: const Text('تطبيق الـ 90 الاتحادية', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              color: const Color(0xFF12121A),
              border: Border.all(color: const Color(0x1AD4AF37), width: 1.5),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('🦁', textAlign: TextAlign.center, style: TextStyle(fontSize: 44)),
                const SizedBox(height: 12),
                const Text('بوابة الفحص والتنقل النظيفة', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Color(0xFFF5E27A), fontWeight: FontWeight.bold)),
                const SizedBox(height: 24),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 14),
                  itemBuilder: (ctx, i) => ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(ctx, items[i]['route']!);
                    },
                    child: Text(items[i]['label']!, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
