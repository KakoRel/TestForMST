import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/premium/premium_state.dart';
import '../../../core/theme/app_theme.dart';

class PaywallPage extends StatefulWidget {
  const PaywallPage({super.key});

  @override
  State<PaywallPage> createState() => _PaywallPageState();
}

enum _PlanType { monthly, yearly }

class _PaywallPageState extends State<PaywallPage> {
  _PlanType _selectedPlan = _PlanType.yearly;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF101632),
              Color(0xFF050814),
            ],
          ),
        ),
        child: SafeArea(
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
            child: Column(
              children: [
                _buildTopBar(theme),
                const SizedBox(height: 12),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        _buildHero(theme),
                        const SizedBox(height: 24),
                        _buildBenefits(theme),
                        const SizedBox(height: 24),
                        _buildPlans(theme),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                _buildCtaButton(theme),
                const SizedBox(height: 10),
                _buildBottomLinks(theme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(
            Icons.close_rounded,
            color: Colors.white,
          ),
        ),
        Text(
          'ZenPulse Premium',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 48),
      ],
    );
  }

  Widget _buildHero(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Больше, чем просто\nмедитации',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w800,
            height: 1.15,
          ),
        ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.1, end: 0),
        const SizedBox(height: 12),
        Text(
          'Открой полный доступ к коллекции ZenPulse: глубокий сон, '
          'фокус, антистресс и персональные практики под твой день.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 24),
        Container(
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.accentPurple,
                AppColors.accentBlue,
                AppColors.accentPink,
              ],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: -40,
                bottom: -30,
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white24,
                  ),
                ),
              ),
              Positioned(
                left: 24,
                top: 26,
                right: 24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.auto_awesome_rounded,
                            color: Colors.white,
                            size: 18,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Эксклюзив для Premium',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Все медитации\nбез ограничений',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Разблокируй закрытые сессии и AI-настрой дня.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ).animate().fadeIn(duration: 600.ms, delay: 150.ms),
      ],
    );
  }

  Widget _buildBenefits(ThemeData theme) {
    final benefits = [
      'Десятки медитаций для сна, фокуса и антистресса',
      'AI-настрой дня под твоё текущее состояние',
      'Неограниченный офлайн-доступ к любимым практикам',
      'Никакой рекламы и лишнего шума',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Что даёт Premium',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 14),
        ...benefits.map(
          (b) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.08),
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    size: 14,
                    color: AppColors.accentBlue,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    b,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.35,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPlans(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Выбери подписку',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 14),
        _PlanTile(
          title: 'Ежемесячно',
          price: '399 ₽',
          subtitle: 'Гибкая оплата, отмена в любой момент',
          perPeriod: 'в месяц',
          isSelected: _selectedPlan == _PlanType.monthly,
          onTap: () => setState(() => _selectedPlan = _PlanType.monthly),
        ),
        const SizedBox(height: 10),
        _PlanTile(
          title: 'Ежегодно',
          price: '2399 ₽',
          subtitle: 'Всего ~200 ₽ в месяц. Самый выгодный вариант.',
          perPeriod: 'за год',
          isSelected: _selectedPlan == _PlanType.yearly,
          highlight: true,
          onTap: () => setState(() => _selectedPlan = _PlanType.yearly),
        ),
      ],
    );
  }

  Widget _buildCtaButton(ThemeData theme) {
    final isYearly = _selectedPlan == _PlanType.yearly;
    final subtitle = isYearly
        ? 'Пробный период, затем 2399 ₽/год'
        : 'Пробный период, затем 399 ₽/мес';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 56,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            onPressed: _onPurchasePressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.lock_open_rounded),
                const SizedBox(width: 8),
                Text(
                  'Попробовать бесплатно',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodySmall?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomLinks(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Заглушка: восстановление покупок.'),
              ),
            );
          },
          child: Text(
            'Восстановить покупки',
            style: theme.textTheme.bodySmall?.copyWith(
              color: Colors.white.withOpacity(0.8),
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        const SizedBox(width: 16),
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Заглушка: условия подписки.'),
              ),
            );
          },
          child: Text(
            'Условия подписки',
            style: theme.textTheme.bodySmall?.copyWith(
              color: Colors.white.withOpacity(0.8),
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  void _onPurchasePressed() {
    PremiumState.instance.activatePremium();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Подписка активирована (мок-покупка).'),
      ),
    );

    Navigator.of(context).maybePop();
  }
}

class _PlanTile extends StatelessWidget {
  const _PlanTile({
    required this.title,
    required this.price,
    required this.subtitle,
    required this.perPeriod,
    required this.isSelected,
    required this.onTap,
    this.highlight = false,
  });

  final String title;
  final String price;
  final String subtitle;
  final String perPeriod;
  final bool isSelected;
  final bool highlight;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final borderColor = isSelected
        ? AppColors.accentPurple
        : Colors.white.withOpacity(0.1);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor, width: 1.4),
          color: const Color(0xFF14182B),
        ),
        child: Row(
          children: [
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.accentPurple
                      : Colors.white.withOpacity(0.5),
                  width: 1.8,
                ),
              ),
              child: Center(
                child: Container(
                  width: 11,
                  height: 11,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        isSelected ? AppColors.accentPurple : Colors.transparent,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      if (highlight) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.accentPurple.withOpacity(0.16),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Text(
                            'Самый выгодный',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: AppColors.accentPurple,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  perPeriod,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

