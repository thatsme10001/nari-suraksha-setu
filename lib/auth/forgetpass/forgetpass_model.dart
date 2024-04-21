import '/flutter_flow/flutter_flow_util.dart';
import 'forgetpass_widget.dart' show ForgetpassWidget;
import 'package:flutter/material.dart';

class ForgetpassModel extends FlutterFlowModel<ForgetpassWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
