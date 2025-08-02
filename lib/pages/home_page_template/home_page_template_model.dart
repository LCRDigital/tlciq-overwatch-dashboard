import '/components/project_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'home_page_template_widget.dart' show HomePageTemplateWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class HomePageTemplateModel extends FlutterFlowModel<HomePageTemplateWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Model for project component.
  late ProjectModel projectModel;

  @override
  void initState(BuildContext context) {
    projectModel = createModel(context, () => ProjectModel());
  }

  @override
  void dispose() {
    projectModel.dispose();
  }
}
