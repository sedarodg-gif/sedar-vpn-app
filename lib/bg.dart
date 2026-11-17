import 'package:flutter/material.dart';

import 'settings.dart';

/// Fond de l'application : dégradé vert profond avec une lueur dorée qui s'allume quand le VPN est connecté.
class AppBackground extends StatelessWidget {
  final bool awake;
  final bool animate;
  const AppBackground({super.key, required this.awake, required this.animate});

  @override
  Widget build(BuildContext context) {
    final g = gGlows;
    final glow = g.isNotEmpty ? g[1] : const Color(0x5F34D399);
    final d = animate ? const Duration(milliseconds: 700) : Duration.zero;
    return Positioned.fill(
      child: Stack(
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF0B1F16), Color(0xFF06100B), Color(0xFF040A07)],
              ),
            ),
            child: SizedBox.expand(),
          ),
          AnimatedContainer(
            duration: d,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0, -0.55),
                radius: awake ? 0.95 : 0.7,
                colors: [glow.withAlpha(awake ? 120 : 55), const Color(0x00000000)],
              ),
            ),
            child: const SizedBox.expand(),
          ),
        ],
      ),
    );
  }
}
