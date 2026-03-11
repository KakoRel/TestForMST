import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/meditation_session.dart';

class MeditationSessionCard extends StatelessWidget {
  const MeditationSessionCard({
    super.key,
    required this.session,
    required this.onTap,
    required this.isPremium,
  });

  final MeditationSession session;
  final VoidCallback onTap;
  final bool isPremium;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final bool isEffectivelyLocked = session.isLocked && !isPremium;

    Widget cardContent = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF22253A),
            Color(0xFF171A2B),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -40,
            top: -30,
            child: Container(
              width: 140,
              height: 140,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    AppColors.accentPurple,
                    AppColors.accentBlue,
                  ],
                ),
              ),
            ).animate().fadeIn(duration: 600.ms).scale(
                  begin: const Offset(0.8, 0.8),
                  end: const Offset(1, 1),
                  curve: Curves.easeOut,
                ),
          ),
          Positioned(
            left: -30,
            bottom: -20,
            child: Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    AppColors.accentPink,
                    AppColors.accentPurple,
                  ],
                ),
              ),
            ).animate().fadeIn(duration: 700.ms),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: Text(
                              session.tag,
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: AppColors.textSecondary,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            session.title,
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.3,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            session.subtitle,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF44486A),
                            Color(0xFF262A42),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          isEffectivelyLocked ? Icons.lock_rounded : Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: isEffectivelyLocked ? 22 : 30,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Icon(
                      Icons.schedule_rounded,
                      size: 18,
                      color: Colors.white.withOpacity(0.8),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${session.durationMinutes} мин',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Icon(
                      Icons.self_improvement_rounded,
                      size: 18,
                      color: Colors.white.withOpacity(0.8),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Глубокое расслабление',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

    if (isEffectivelyLocked) {
      cardContent = ColorFiltered(
        colorFilter: const ColorFilter.mode(
          Colors.black54,
          BlendMode.saturation,
        ),
        child: Stack(
          children: [
            cardContent,
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: AppColors.lockedOverlay,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.08),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.lock_rounded,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Доступно в Premium',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: cardContent
          .animate()
          .fadeIn(duration: 450.ms, curve: Curves.easeOut)
          .slideY(begin: 0.05, end: 0, duration: 450.ms),
    );
  }
}

