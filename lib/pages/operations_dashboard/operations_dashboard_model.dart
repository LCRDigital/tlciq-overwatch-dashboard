import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_model.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'operations_dashboard_widget.dart';

export 'operations_dashboard_model.dart';

class OperationsDashboardModel extends FlutterFlowModel<OperationsDashboardWidget> {
  // Animation controllers
  late AnimationController backgroundAnimationController;
  late Animation<double> backgroundAnimation;

  // State variables
  DateTime lastUpdate = DateTime.now();
  
  // Mock data - In a real app, this would come from API calls
  final List<Map<String, dynamic>> _recentActivities = [
    {
      'project': 'Project Alpha',
      'activity': 'Unit completed: SKU-001234',
      'status': 'completed',
      'time': '2 min ago',
    },
    {
      'project': 'Project Beta',
      'activity': 'Quality check passed',
      'status': 'on_track',
      'time': '5 min ago',
    },
    {
      'project': 'Project Gamma',
      'activity': 'Delay reported - Material shortage',
      'status': 'at_risk',
      'time': '8 min ago',
    },
    {
      'project': 'Project Delta',
      'activity': 'Production started',
      'status': 'in_progress',
      'time': '12 min ago',
    },
    {
      'project': 'Project Epsilon',
      'activity': 'Batch QC completed',
      'status': 'completed',
      'time': '15 min ago',
    },
    {
      'project': 'Project Zeta',
      'activity': 'Schedule adjustment required',
      'status': 'needs_attention',
      'time': '18 min ago',
    },
    {
      'project': 'Project Eta',
      'activity': 'Equipment calibration',
      'status': 'in_progress',
      'time': '22 min ago',
    },
    {
      'project': 'Project Theta',
      'activity': 'Milestone reached',
      'status': 'completed',
      'time': '25 min ago',
    },
  ];

  final List<Map<String, dynamic>> _activeProjects = [
    {
      'name': 'TLCiQ Production Line A',
      'status': 'on_track',
      'progress': 0.87,
      'dueDate': '2024-02-15',
    },
    {
      'name': 'TLCiQ Production Line B',
      'status': 'needs_attention',
      'progress': 0.65,
      'dueDate': '2024-02-18',
    },
    {
      'name': 'TLCiQ Quality Control Enhancement',
      'status': 'in_progress',
      'progress': 0.42,
      'dueDate': '2024-02-20',
    },
    {
      'name': 'TLCiQ Supply Chain Optimization',
      'status': 'at_risk',
      'progress': 0.23,
      'dueDate': '2024-02-22',
    },
    {
      'name': 'TLCiQ Equipment Maintenance',
      'status': 'on_track',
      'progress': 0.91,
      'dueDate': '2024-02-14',
    },
    {
      'name': 'TLCiQ Batch Processing Upgrade',
      'status': 'in_progress',
      'progress': 0.58,
      'dueDate': '2024-02-25',
    },
  ];

  void initializeAnimations(TickerProvider tickerProvider) {
    backgroundAnimationController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: tickerProvider,
    );
    
    backgroundAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: backgroundAnimationController,
      curve: Curves.easeInOut,
    ));
    
    backgroundAnimationController.repeat();
  }

  String getFormattedTime() {
    final now = DateTime.now();
    return DateFormat('HH:mm:ss').format(now);
  }

  List<Map<String, dynamic>> getRecentActivities() {
    return _recentActivities;
  }

  List<Map<String, dynamic>> getActiveProjects() {
    return _activeProjects;
  }

  // Simulate real-time data updates
  void updateData() {
    lastUpdate = DateTime.now();
    // In a real app, this would trigger API calls to refresh data
    // Note: FlutterFlowModel doesn't have notifyListeners, use safeSetState in widget instead
  }

  // Status indicators data
  Map<String, int> getStatusIndicators() {
    return {
      'on_track': 24,
      'needs_attention': 8,
      'at_risk': 3,
    };
  }

  // Pacing metrics data
  Map<String, dynamic> getPacingMetrics() {
    return {
      'units_completed': 1247,
      'units_completed_change': 12,
      'scheduled_today': 156,
      'scheduled_today_change': 0,
      'completion_rate': 87.4,
      'completion_rate_change': 5,
    };
  }

  // Header statistics
  Map<String, dynamic> getHeaderStats() {
    return {
      'total_projects': _activeProjects.length,
      'active_projects': _activeProjects.where((p) => p['status'] == 'in_progress').length,
      'completed_today': _recentActivities.where((a) => a['status'] == 'completed').length,
      'alerts': _activeProjects.where((p) => p['status'] == 'at_risk').length,
    };
  }

  @override
  void initState(BuildContext context) {
    // Initialize any additional state here
  }

  @override
  void dispose() {
    backgroundAnimationController.dispose();
  }
} 