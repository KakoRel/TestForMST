import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import '../domain/meditation_session.dart';
import 'widgets/session_card.dart';

class MeditationsPage extends StatefulWidget {
  const MeditationsPage({super.key});

  @override
  State<MeditationsPage> createState() => _MeditationsPageState();
}

class _MeditationsPageState extends State<MeditationsPage> {
  bool hasPremium = false;
  String selectedTag = 'Все';

  late final List<MeditationSession> _allSessions = [
    const MeditationSession(
      id: 'sunrise',
      title: 'Утренняя тишина',
      subtitle: 'Мягкий старт дня с фокусом на дыхании',
      durationMinutes: 10,
      imageUrl: '',
      isLocked: false,
      tag: 'Утро',
    ),
    const MeditationSession(
      id: 'deep_sleep',
      title: 'Глубокий сон',
      subtitle: 'Отпусти напряжение и подготовь тело ко сну',
      durationMinutes: 20,
      imageUrl: '',
      isLocked: true,
      tag: 'Сон',
    ),
    const MeditationSession(
      id: 'focus_now',
      title: 'Чистый фокус',
      subtitle: 'Собери внимание и войди в поток',
      durationMinutes: 12,
      imageUrl: '',
      isLocked: true,
      tag: 'Фокус',
    ),
    const MeditationSession(
      id: 'anxiety_release',
      title: 'Отпускание тревоги',
      subtitle: 'Мягкая практика для замедления ума',
      durationMinutes: 15,
      imageUrl: '',
      isLocked: false,
      tag: 'Антистресс',
    ),
  ];

  List<String> get _tags =>
      ['Все', 'Утро', 'Сон', 'Фокус', 'Антистресс'];

  List<MeditationSession> get _visibleSessions {
    if (selectedTag == 'Все') {
      return _allSessions;
    }
    return _allSessions.where((s) => s.tag == selectedTag).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF090C1C),
              Color(0xFF050814),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                _buildHeader(theme),
                const SizedBox(height: 22),
                _buildSearchField(theme),
                const SizedBox(height: 18),
                _buildTags(theme),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.only(bottom: 32),
                    itemCount: _visibleSessions.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 18),
                    itemBuilder: (context, index) {
                      final session = _visibleSessions[index];
                      return MeditationSessionCard(
                        session: session,
                        onTap: () => _onSessionTap(session),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(theme),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [
                AppColors.accentPurple,
                AppColors.accentBlue,
              ],
            ),
          ),
          child: const Icon(
            Icons.self_improvement_rounded,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ZenPulse',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.4,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Выбери медитацию под своё настроение',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        GestureDetector(
          onTap: () {
            // TODO: переход на экран профиля или paywall
          },
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white.withOpacity(0.06),
            child: const Icon(
              Icons.person_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchField(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF111526),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(
            Icons.search_rounded,
            color: Colors.white.withOpacity(0.6),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: 'Поиск по сессиям',
                hintStyle: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
              cursorColor: AppColors.accentPurple,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.white.withOpacity(0.06),
            ),
            child: const Icon(
              Icons.tune_rounded,
              size: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTags(ThemeData theme) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _tags.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final tag = _tags[index];
          final isSelected = tag == selectedTag;

          return ChoiceChip(
            label: Text(tag),
            selected: isSelected,
            onSelected: (_) {
              setState(() {
                selectedTag = tag;
              });
            },
            backgroundColor: const Color(0xFF181C2F),
            selectedColor: AppColors.accentPurple,
            labelStyle: theme.textTheme.bodyMedium?.copyWith(
              color: isSelected ? Colors.white : AppColors.textSecondary,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomBar(ThemeData theme) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF111526).withOpacity(0.96),
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            offset: const Offset(0, 18),
            blurRadius: 40,
            spreadRadius: -16,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _BottomItem(
            icon: Icons.self_improvement_rounded,
            label: 'Медитации',
            isActive: true,
          ),
          _BottomItem(
            icon: Icons.auto_awesome_rounded,
            label: 'AI Vibe',
            isActive: false,
          ),
          _BottomItem(
            icon: Icons.person_rounded,
            label: 'Профиль',
            isActive: false,
          ),
        ],
      ),
    );
  }

  void _onSessionTap(MeditationSession session) {
    if (session.isLocked && !hasPremium) {
      // TODO: здесь будет переход на Paywall
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Эта сессия доступна в Premium. Откроем экран подписки позже.',
          ),
        ),
      );
      return;
    }

    // TODO: переход на экран проигрывания медитации
  }
}

class _BottomItem extends StatelessWidget {
  const _BottomItem({
    required this.icon,
    required this.label,
    required this.isActive,
  });

  final IconData icon;
  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: isActive
                ? const LinearGradient(
                    colors: [
                      AppColors.accentPurple,
                      AppColors.accentBlue,
                    ],
                  )
                : null,
            color: isActive ? null : Colors.transparent,
          ),
          child: Icon(
            icon,
            color: isActive ? Colors.white : AppColors.textSecondary,
            size: isActive ? 24 : 22,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: isActive ? Colors.white : AppColors.textSecondary,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

