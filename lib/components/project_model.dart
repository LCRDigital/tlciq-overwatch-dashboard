import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'project_widget.dart' show ProjectWidget;
import 'package:flutter/material.dart';

class ProjectModel extends FlutterFlowModel<ProjectWidget> {
  ///  Local state fields for this component.

  ProjectStatus? notstarted;

  ProjectStatus? inprogress;

  ProjectStatus? completed;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
