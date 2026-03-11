import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/meditations/presentation/meditations_page.dart';

class ZenPulseApp extends StatelessWidget {
  const ZenPulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZenPulse',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MeditationsPage(),
    );
  }
}

