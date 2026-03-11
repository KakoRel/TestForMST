# ZenPulse — AI Meditation App 🧘‍♂️

[![Flutter](https://img.shields.io/badge/Flutter-3.11-blue?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.11-blue?logo=dart)](https://dart.dev)
[![Platform](https://img.shields.io/badge/platform-Android%20%7C%20iOS-green)]()

**ZenPulse** — это современное мобильное приложение для медитации с AI-генерацией персональных практик и премиум-подпиской.

---

## 📱 Возможности

### 🔓 Paywall (Экран подписки)
- Яркий дизайн в стиле медитативных приложений
- Список Premium-преимуществ
- Два тарифа: **ежемесячный** (399 ₽) и **ежегодный** (2399 ₽) с выделением выгодного
- Кнопка «Попробовать бесплатно» с имитацией покупки

### 🧘‍♀️ Медитации (Главный экран)
- Каталог сессий с карточками (название, описание, длительность)
- Фильтрация по тегам: *Утро*, *Сон*, *Фокус*, *Антистресс*
- Поиск по сессиям
- Блокировка премиум-контента для бесплатных пользователей

### ✨ AI Vibe (Настрой дня)
- Генерация аффирмаций на основе настроения (3 варианта: 😌 Спокойно, 😐 Нейтрально, 😔 Тяжеловато)
- Реалистичные мок-ответы от LLM
- Доступно только Premium-пользователям

---

## 🏗️ Архитектура

Проект следует модульной структуре с разделением по слоям:

```
lib/
├── core/                    # Общие компоненты
│   ├── premium/            # Управление подпиской
│   │   ├── premium_state.dart
│   │   └── premium_repository.dart
│   └── theme/              # Темизация
│       └── app_theme.dart
├── features/               # Функциональные модули
│   ├── meditations/        # Медитации
│   │   ├── domain/
│   │   │   └── meditation_session.dart
│   │   └── presentation/
│   │       ├── meditations_page.dart
│   │       └── widgets/
│   │           └── session_card.dart
│   ├── paywall/            # Paywall
│   │   └── presentation/
│   │       └── paywall_page.dart
│   └── ai_vibe/            # AI Vibe
│       ├── domain/
│       │   └── ai_vibe_service.dart
│       └── presentation/
│           └── ai_vibe_page.dart
└── main.dart
```

### Состояние приложения
- **PremiumState** — единый источник истины о статусе подписки (ChangeNotifier)
- **PremiumRepository** — сохранение/загрузка статуса подписки (SQLite)
- Реактивное обновление UI при изменении статуса

---

## 🚀 Быстрый старт

### Требования
- Flutter SDK **≥ 3.11**
- Dart SDK **≥ 3.11**
- Android Studio / Xcode (для эмуляторов)

### Установка

```bash
# Клонирование репозитория
git clone https://github.com/yourusername/test_for_mst.git
cd test_for_mst

# Установка зависимостей
flutter pub get

# Запуск приложения
flutter run
```

### Сборка релиза

```bash
# Android APK
flutter build apk --release

# iOS
flutter build ios --release
```

---

## 📦 Зависимости

| Пакет | Назначение |
|-------|------------|
| `google_fonts` | Шрифты Google (Plus Jakarta Sans) |
| `flutter_animate` | Анимации UI-компонентов |
| `sqflite` | Локальная база данных для хранения подписки |
| `path` | Утилиты для работы с путями |
| `cupertino_icons` | iOS-иконки |

---

## 🎨 Дизайн-система

### Цветовая палитра

```dart
class AppColors {
  static const Color backgroundDark = Color(0xFF050814);
  static const Color backgroundCard = Color(0xFF111526);
  static const Color accentPurple = Color(0xFF9C6BFF);
  static const Color accentBlue = Color(0xFF4AD0FF);
  static const Color accentPink = Color(0xFFFF7AC3);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFB6B8D6);
}
```

### Темизация
- Material 3 (dark theme)
- Кастомные градиенты для фонов и акцентов
- Закруглённые карточки (24px)
- Glassmorphism-эффекты

---

## 🔐 Ориентация экрана

Приложение работает **только в портретной ориентации**:
- Android: `android:screenOrientation="portrait"`
- iOS: `UISupportedInterfaceOrientations` → Portrait

---

## 📂 Структура данных

### MeditationSession
```dart
class MeditationSession {
  final String id;
  final String title;
  final String subtitle;
  final int durationMinutes;
  final String imageUrl;
  final bool isLocked;
  final String tag;
}
```

### AiMood
```dart
enum AiMood { calm, neutral, low }
```

---

## 🛠️ Разработка

### Запуск тестов
```bash
flutter test
```

### Линтинг
```bash
flutter analyze
```

### Форматирование
```bash
dart format .
```

---
