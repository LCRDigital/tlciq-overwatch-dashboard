import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:ui';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/components/glassmorphic_card.dart';
import '/components/glow_text.dart';
import 'operations_dashboard_model.dart';
export 'operations_dashboard_model.dart';

class OperationsDashboardWidget extends StatefulWidget {
  const OperationsDashboardWidget({super.key});

  static String routeName = 'OperationsDashboard';
  static String routePath = '/operations-dashboard';

  @override
  State<OperationsDashboardWidget> createState() => _OperationsDashboardWidgetState();
}

class _OperationsDashboardWidgetState extends State<OperationsDashboardWidget> 
    with TickerProviderStateMixin {
  late OperationsDashboardModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OperationsDashboardModel());
    
    // Initialize animations for the background effect
    _model.initializeAnimations(this);
    
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: theme.primaryBackground,
        body: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                theme.primaryBackground,
                const Color(0xFF1A1A2E),
                const Color(0xFF16213E),
              ],
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
          child: Stack(
            children: [
              // Animated background particles
              AnimatedBuilder(
                animation: _model.backgroundAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: 1.0 + (_model.backgroundAnimation.value * 0.1),
                    child: Transform.rotate(
                      angle: _model.backgroundAnimation.value * 0.1,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            center: const Alignment(-0.8, -0.8),
                            radius: 0.5,
                            colors: [
                              theme.purpleGlow.withOpacity(0.15),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              AnimatedBuilder(
                animation: _model.backgroundAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: 1.1 - (_model.backgroundAnimation.value * 0.1),
                    child: Transform.rotate(
                      angle: -_model.backgroundAnimation.value * 0.08,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            center: const Alignment(0.8, 0.8),
                            radius: 0.5,
                            colors: [
                              theme.blueGlow.withOpacity(0.15),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              
              // Main dashboard content
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Section
                      _buildHeader(theme),
                      
                      const SizedBox(height: 32),
                      
                      // Main Dashboard Grid
                      Expanded(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            // Responsive layout for different screen sizes
                            if (constraints.maxWidth > 1200) {
                              return _buildLargeScreenLayout(theme);
                            } else if (constraints.maxWidth > 800) {
                              return _buildMediumScreenLayout(theme);
                            } else {
                              return _buildSmallScreenLayout(theme);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(FlutterFlowTheme theme) {
    return GlassmorphicCard(
      isStrong: true,
      hasPurpleGlow: true,
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TvOptimizedText(
                  'TLCiQ OVERWATCH',
                  style: theme.displayLarge.copyWith(
                    fontSize: 48,
                    letterSpacing: 2.0,
                  ),
                  glowColor: GlowColor.purple,
                ),
                const SizedBox(height: 8),
                TvOptimizedText(
                  'OPERATIONS CENTER',
                  style: theme.headlineMedium.copyWith(
                    fontSize: 24,
                    letterSpacing: 1.0,
                  ),
                  glowColor: GlowColor.blue,
                ),
              ],
            ),
          ),
          GlassmorphicCard(
            padding: const EdgeInsets.all(16.0),
            hasPulseGlow: true,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                                 FaIcon(
                   FontAwesomeIcons.rss,
                   color: theme.success,
                   size: 24,
                 ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TvOptimizedText(
                      'LIVE',
                      style: theme.bodyMedium.copyWith(fontSize: 16),
                      glowColor: GlowColor.green,
                    ),
                    TvOptimizedText(
                      'Last Update: ${_model.getFormattedTime()}',
                      style: theme.bodySmall.copyWith(fontSize: 12),
                      glowColor: GlowColor.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLargeScreenLayout(FlutterFlowTheme theme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Column - Status Indicators & Metrics
        Expanded(
          flex: 2,
          child: Column(
            children: [
              _buildStatusIndicators(theme),
              const SizedBox(height: 24),
              _buildPacingMetrics(theme),
            ],
          ),
        ),
        
        const SizedBox(width: 24),
        
        // Center Column - Recent Activity (Prominent)
        Expanded(
          flex: 3,
          child: _buildRecentActivity(theme),
        ),
        
        const SizedBox(width: 24),
        
        // Right Column - Active Projects
        Expanded(
          flex: 2,
          child: _buildActiveProjects(theme),
        ),
      ],
    );
  }

  Widget _buildMediumScreenLayout(FlutterFlowTheme theme) {
    return Column(
      children: [
        // Top Row - Status and Metrics
        Row(
          children: [
            Expanded(child: _buildStatusIndicators(theme)),
            const SizedBox(width: 24),
            Expanded(child: _buildPacingMetrics(theme)),
          ],
        ),
        
        const SizedBox(height: 24),
        
        // Bottom Row - Activity and Projects
        Expanded(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildRecentActivity(theme),
              ),
              const SizedBox(width: 24),
              Expanded(
                flex: 1,
                child: _buildActiveProjects(theme),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSmallScreenLayout(FlutterFlowTheme theme) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildStatusIndicators(theme),
          const SizedBox(height: 24),
          _buildPacingMetrics(theme),
          const SizedBox(height: 24),
          _buildRecentActivity(theme),
          const SizedBox(height: 24),
          _buildActiveProjects(theme),
        ],
      ),
    );
  }

  Widget _buildStatusIndicators(FlutterFlowTheme theme) {
    return GlassmorphicCard(
      height: 280,
      isStrong: true,
      hasBlueGlow: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.chartLine,
                color: theme.info,
                size: 24,
              ),
              const SizedBox(width: 12),
              TvOptimizedText(
                'STATUS INDICATORS',
                style: theme.headlineSmall.copyWith(fontSize: 18),
                glowColor: GlowColor.blue,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Column(
              children: [
                _buildStatusCard('ON TRACK', '24', GlowColor.green, FontAwesomeIcons.check),
                const SizedBox(height: 16),
                                 _buildStatusCard('NEEDS ATTENTION', '8', GlowColor.yellow, FontAwesomeIcons.triangleExclamation),
                 const SizedBox(height: 16),
                 _buildStatusCard('AT RISK', '3', GlowColor.red, FontAwesomeIcons.triangleExclamation),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusCard(String label, String value, GlowColor glowColor, IconData icon) {
    final theme = FlutterFlowTheme.of(context);
    
    return Expanded(
      child: GlassmorphicCard(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: _getGlowColorValue(glowColor).withOpacity(0.2),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: FaIcon(
                icon,
                color: _getGlowColorValue(glowColor),
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TvOptimizedText(
                    value,
                    style: theme.displaySmall.copyWith(fontSize: 28),
                    glowColor: glowColor,
                  ),
                  TvOptimizedText(
                    label,
                    style: theme.bodyMedium.copyWith(fontSize: 14),
                    glowColor: GlowColor.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPacingMetrics(FlutterFlowTheme theme) {
    return GlassmorphicCard(
      height: 280,
      isStrong: true,
      hasGreenGlow: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
                             FaIcon(
                 FontAwesomeIcons.gaugeHigh,
                 color: theme.success,
                 size: 24,
               ),
              const SizedBox(width: 12),
              TvOptimizedText(
                'PACING METRICS',
                style: theme.headlineSmall.copyWith(fontSize: 18),
                glowColor: GlowColor.green,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Column(
              children: [
                _buildMetricCard('UNITS COMPLETED', '1,247', '↗ 12%', GlowColor.green),
                const SizedBox(height: 16),
                _buildMetricCard('SCHEDULED TODAY', '156', '→ 0%', GlowColor.blue),
                const SizedBox(height: 16),
                _buildMetricCard('COMPLETION RATE', '87.4%', '↗ 5%', GlowColor.purple),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(String label, String value, String change, GlowColor glowColor) {
    final theme = FlutterFlowTheme.of(context);
    
    return Expanded(
      child: GlassmorphicCard(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TvOptimizedText(
              value,
              style: theme.displaySmall.copyWith(fontSize: 24),
              glowColor: glowColor,
            ),
            const SizedBox(height: 4),
            TvOptimizedText(
              label,
              style: theme.bodyMedium.copyWith(fontSize: 12),
              glowColor: GlowColor.white,
            ),
            const SizedBox(height: 8),
            TvOptimizedText(
              change,
              style: theme.bodySmall.copyWith(fontSize: 12),
              glowColor: change.startsWith('↗') ? GlowColor.green : 
                      change.startsWith('↘') ? GlowColor.red : GlowColor.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivity(FlutterFlowTheme theme) {
    return GlassmorphicCard(
      isStrong: true,
      hasPurpleGlow: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.clock,
                color: theme.primary,
                size: 24,
              ),
              const SizedBox(width: 12),
              TvOptimizedText(
                'RECENT ACTIVITY',
                style: theme.headlineSmall.copyWith(fontSize: 18),
                glowColor: GlowColor.purple,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.separated(
              itemCount: _model.getRecentActivities().length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final activity = _model.getRecentActivities()[index];
                return _buildActivityItem(activity, theme);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(Map<String, dynamic> activity, FlutterFlowTheme theme) {
    return GlassmorphicCard(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: _getStatusColor(activity['status']),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: _getStatusColor(activity['status']).withOpacity(0.6),
                  blurRadius: 8.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TvOptimizedText(
                  activity['project'],
                  style: theme.bodyMedium.copyWith(fontSize: 14),
                  glowColor: GlowColor.white,
                ),
                const SizedBox(height: 4),
                TvOptimizedText(
                  activity['activity'],
                  style: theme.bodySmall.copyWith(fontSize: 12),
                  glowColor: GlowColor.blue,
                ),
              ],
            ),
          ),
          TvOptimizedText(
            activity['time'],
            style: theme.bodySmall.copyWith(fontSize: 12),
            glowColor: GlowColor.white,
          ),
        ],
      ),
    );
  }

  Widget _buildActiveProjects(FlutterFlowTheme theme) {
    return GlassmorphicCard(
      isStrong: true,
      hasBlueGlow: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
                             FaIcon(
                 FontAwesomeIcons.listCheck,
                 color: theme.info,
                 size: 24,
               ),
              const SizedBox(width: 12),
              TvOptimizedText(
                'ACTIVE PROJECTS',
                style: theme.headlineSmall.copyWith(fontSize: 18),
                glowColor: GlowColor.blue,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.separated(
              itemCount: _model.getActiveProjects().length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final project = _model.getActiveProjects()[index];
                return _buildProjectCard(project, theme);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(Map<String, dynamic> project, FlutterFlowTheme theme) {
    final progress = project['progress'] as double;
    
    return GlassmorphicCard(
      padding: const EdgeInsets.all(16.0),
      hasHoverEffect: true,
      onTap: () {
        // Handle project tap
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TvOptimizedText(
                  project['name'],
                  style: theme.bodyMedium.copyWith(fontSize: 14),
                  glowColor: GlowColor.white,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getStatusColor(project['status']).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TvOptimizedText(
                  project['status'].toString().toUpperCase(),
                  style: theme.bodySmall.copyWith(fontSize: 10),
                  glowColor: _getStatusGlowColor(project['status']),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TvOptimizedText(
                'Progress: ${(progress * 100).toInt()}%',
                style: theme.bodySmall.copyWith(fontSize: 12),
                glowColor: GlowColor.white,
              ),
              const SizedBox(height: 8),
              Container(
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: progress,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [theme.primary, theme.secondary],
                      ),
                      borderRadius: BorderRadius.circular(3),
                      boxShadow: [
                        BoxShadow(
                          color: theme.primary.withOpacity(0.6),
                          blurRadius: 6.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getGlowColorValue(GlowColor glowColor) {
    final theme = FlutterFlowTheme.of(context);
    switch (glowColor) {
      case GlowColor.white:
        return Colors.white;
      case GlowColor.purple:
        return theme.primary;
      case GlowColor.blue:
        return theme.secondary;
      case GlowColor.green:
        return theme.success;
      case GlowColor.yellow:
        return theme.warning;
      case GlowColor.red:
        return theme.error;
      default:
        return Colors.white;
    }
  }

  Color _getStatusColor(String status) {
    final theme = FlutterFlowTheme.of(context);
    switch (status.toLowerCase()) {
      case 'completed':
      case 'on_track':
        return theme.success;
      case 'in_progress':
      case 'needs_attention':
        return theme.warning;
      case 'at_risk':
      case 'delayed':
        return theme.error;
      default:
        return theme.info;
    }
  }

  GlowColor _getStatusGlowColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
      case 'on_track':
        return GlowColor.green;
      case 'in_progress':
      case 'needs_attention':
        return GlowColor.yellow;
      case 'at_risk':
      case 'delayed':
        return GlowColor.red;
      default:
        return GlowColor.blue;
    }
  }
} 