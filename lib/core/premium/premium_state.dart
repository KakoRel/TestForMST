import 'package:flutter/foundation.dart';

import 'premium_repository.dart';

class PremiumState extends ChangeNotifier {
  PremiumState._();

  static final PremiumState instance = PremiumState._();

  bool _isPremium = false;
  bool _initialized = false;

  bool get isPremium => _isPremium;
  bool get isInitialized => _initialized;

  Future<void> init() async {
    if (_initialized) return;
    final repo = PremiumRepository.instance;
    _isPremium = await repo.loadIsPremium();
    _initialized = true;
    notifyListeners();
  }

  Future<void> activatePremium() async {
    if (_isPremium) return;
    _isPremium = true;
    await PremiumRepository.instance.saveIsPremium(true);
    notifyListeners();
  }
}

