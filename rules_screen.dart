import 'package:flutter/material.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rules = [
      'التفاعل المستمر مع منشورات النادي يمنحك نقاطاً إضافية.',
      'توقع نتائج المباريات بشكل صحيح يضاعف رصيدك من النقاط.',
      'الروح الرياضية والابتعاد عن التعصب شرط أساسي للاستمرار في المسابقة.',
      'تُحدث لوحة المتصدرين تلقائياً بعد نهاية كل جولة للمسابقة.',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('⚖️ دستور وقوانين المسابقة')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.separated(
          itemCount: rules.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (ctx, i) => Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF12121A),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0x1AD4AF37), width: 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('🔸', style: TextStyle(fontSize: 18)),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    rules[i],
                    style: const TextStyle(fontSize: 15, color: Colors.white, height: 1.5, fontWeight: FontWeight.w500),
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
