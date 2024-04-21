import '/flutter_flow/flutter_flow_util.dart';
import 'safetytips_widget.dart' show SafetytipsWidget;
import 'package:flutter/material.dart';

class SafetytipsModel extends FlutterFlowModel<SafetytipsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
