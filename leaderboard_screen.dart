import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final list = [
      {'rank': '1', 'name': 'نمر الغربية', 'points': '950'},
      {'rank': '2', 'name': 'اتحادي صميم', 'points': '890'},
      {'rank': '3', 'name': 'أبو نورة 90', 'points': '820'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('🏆 لوحة متصدري النمور')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (ctx, i) => Card(
            color: const Color(0xFF12121A),
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Color(0x3AD4AF37)),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color(0xFFD4AF37),
                foregroundColor: const Color(0xFF0A0A0F),
                child: Text(list[i]['rank']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              title: Text(list[i]['name']!, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              trailing: Text('${list[i]['points']} نقطة', style: const TextStyle(color: Color(0xFFF5E27A), fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ),
    );
  }
}
