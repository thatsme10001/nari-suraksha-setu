import '/flutter_flow/flutter_flow_util.dart';
import 'awarness_widget.dart' show AwarnessWidget;
import 'package:flutter/material.dart';

class AwarnessModel extends FlutterFlowModel<AwarnessWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
