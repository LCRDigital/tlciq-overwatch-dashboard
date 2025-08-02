import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_theme.dart';

enum GlowColor {
  white,
  purple,
  blue,
  green,
  yellow,
  emerald,
  orange,
  red,
}

class GlowText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final GlowColor glowColor;
  final bool isTvOptimized;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const GlowText(
    this.text, {
    Key? key,
    this.style,
    this.glowColor = GlowColor.white,
    this.isTvOptimized = true,
    this.textAlign,
    this.maxLines,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    
    Color primaryGlow;
    Color secondaryGlow;
    
    switch (glowColor) {
      case GlowColor.white:
        primaryGlow = Colors.white.withOpacity(0.8);
        secondaryGlow = Colors.white.withOpacity(0.6);
        break;
      case GlowColor.purple:
        primaryGlow = theme.purpleGlow;
        secondaryGlow = const Color(0xCCA855F7); // rgba(168, 85, 247, 0.8)
        break;
      case GlowColor.blue:
        primaryGlow = theme.blueGlow;
        secondaryGlow = const Color(0xCC60A5FA); // rgba(96, 165, 250, 0.8)
        break;
      case GlowColor.green:
        primaryGlow = theme.greenGlow;
        secondaryGlow = const Color(0xCC22C55E); // rgba(34, 197, 94, 0.8)
        break;
      case GlowColor.yellow:
        primaryGlow = const Color(0xFFEAB308);
        secondaryGlow = const Color(0xCCEAB308);
        break;
      case GlowColor.emerald:
        primaryGlow = const Color(0xFF10B981);
        secondaryGlow = const Color(0xCC10B981);
        break;
      case GlowColor.orange:
        primaryGlow = const Color(0xFFF97316);
        secondaryGlow = const Color(0xCCF97316);
        break;
      case GlowColor.red:
        primaryGlow = const Color(0xFFEF4444);
        secondaryGlow = const Color(0xCCEF4444);
        break;
    }

    TextStyle finalStyle = (style ?? theme.bodyMedium).copyWith(
      fontWeight: isTvOptimized ? FontWeight.w900 : style?.fontWeight ?? FontWeight.bold,
      letterSpacing: isTvOptimized ? 0.025 : style?.letterSpacing,
      shadows: [
        Shadow(
          color: primaryGlow,
          blurRadius: 5.0,
        ),
        Shadow(
          color: secondaryGlow,
          blurRadius: 10.0,
        ),
        Shadow(
          color: primaryGlow.withOpacity(0.4),
          blurRadius: 15.0,
        ),
        if (glowColor == GlowColor.purple)
          Shadow(
            color: primaryGlow.withOpacity(0.4),
            blurRadius: 20.0,
          ),
        Shadow(
          color: Colors.black.withOpacity(0.8),
          blurRadius: 8.0,
          offset: const Offset(0, 2),
        ),
      ],
    );

    return Text(
      text,
      style: finalStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

class TvOptimizedText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final GlowColor glowColor;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const TvOptimizedText(
    this.text, {
    Key? key,
    this.style,
    this.glowColor = GlowColor.white,
    this.textAlign,
    this.maxLines,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlowText(
      text,
      style: style,
      glowColor: glowColor,
      isTvOptimized: true,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
} 