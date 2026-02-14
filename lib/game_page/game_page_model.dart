import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bolge_yasagi_widget.dart';
import '/components/bonus_iptali_widget.dart';
import '/components/ekstra_harf_jokeri_widget.dart';
import '/components/harf_kaybi_widget.dart';
import '/components/harf_yasagi_widget.dart';
import '/components/joker_sec_widget.dart';
import '/components/kelime_iptali_widget.dart';
import '/components/puan_transferi_widget.dart';
import '/components/sag_taraf_yasak_widget.dart';
import '/components/sol_taraf_yasak_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'game_page_widget.dart' show GamePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class GamePageModel extends FlutterFlowModel<GamePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - initializeJSON] action in Container widget.
  dynamic? jsonFile;
  // Stores action output result for [Custom Action - initializeJSON] action in Container widget.
  dynamic? player2JsonFile;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
