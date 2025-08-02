import 'package:flutter/material.dart';
import 'dart:ui';
import '/flutter_flow/flutter_flow_theme.dart';

class GlassmorphicCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final double borderRadius;
  final bool isStrong;
  final bool hasPurpleGlow;
  final bool hasBlueGlow;
  final bool hasGreenGlow;
  final bool hasPulseGlow;
  final bool hasHoverEffect;
  final VoidCallback? onTap;

  const GlassmorphicCard({
    Key? key,
    required this.child,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.borderRadius = 16.0,
    this.isStrong = false,
    this.hasPurpleGlow = false,
    this.hasBlueGlow = false,
    this.hasGreenGlow = false,
    this.hasPulseGlow = false,
    this.hasHoverEffect = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    
    Color glowColor = Colors.transparent;
    if (hasPurpleGlow) glowColor = theme.purpleGlow;
    if (hasBlueGlow) glowColor = theme.blueGlow;
    if (hasGreenGlow) glowColor = theme.greenGlow;

    Widget cardWidget = Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: isStrong 
            ? const Color(0x14FFFFFF) // rgba(255, 255, 255, 0.08)
            : theme.glassBackground,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: isStrong 
              ? const Color(0x26FFFFFF) // rgba(255, 255, 255, 0.15)
              : theme.glassBorder,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: isStrong ? 40.0 : 32.0,
            offset: Offset(0, isStrong ? 12.0 : 8.0),
          ),
          if (glowColor != Colors.transparent)
            BoxShadow(
              color: glowColor.withOpacity(0.2),
              blurRadius: 30.0,
              offset: const Offset(0, 0),
            ),
          BoxShadow(
            color: Colors.white.withOpacity(isStrong ? 0.15 : 0.1),
            blurRadius: 1.0,
            offset: const Offset(0, 1),
            spreadRadius: -1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: isStrong ? 25.0 : 20.0,
            sigmaY: isStrong ? 25.0 : 20.0,
          ),
          child: Container(
            padding: padding ?? const EdgeInsets.all(16.0),
            child: child,
          ),
        ),
      ),
    );

    if (hasPulseGlow) {
      cardWidget = AnimatedContainer(
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOut,
        child: cardWidget,
      );
    }

    if (hasHoverEffect && onTap != null) {
      cardWidget = Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius),
          hoverColor: Colors.white.withOpacity(0.05),
          splashColor: Colors.white.withOpacity(0.1),
          child: cardWidget,
        ),
      );
    } else if (onTap != null) {
      cardWidget = GestureDetector(
        onTap: onTap,
        child: cardWidget,
      );
    }

    return cardWidget;
  }
} 