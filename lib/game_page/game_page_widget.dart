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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'game_page_model.dart';
export 'game_page_model.dart';

class GamePageWidget extends StatefulWidget {
  const GamePageWidget({
    super.key,
    required this.oyunID,
  });

  final String? oyunID;

  static String routeName = 'GamePage';
  static String routePath = '/gamePage';

  @override
  State<GamePageWidget> createState() => _GamePageWidgetState();
}

class _GamePageWidgetState extends State<GamePageWidget> {
  late GamePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GamePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kelime Mayınları',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        font: GoogleFonts.interTight(
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                        color: Colors.white,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(AnaEkranWidget.routeName);
                  },
                  text: 'Ana Ekran',
                  options: FFButtonOptions(
                    height: 30.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF2F0F00),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
            ),
            actions: [],
            centerTitle: false,
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  StreamBuilder<List<SingleGameRecord>>(
                    stream: querySingleGameRecord(
                      queryBuilder: (singleGameRecord) =>
                          singleGameRecord.where(
                        'gameID',
                        isEqualTo: widget!.oyunID,
                      ),
                      singleRecord: true,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<SingleGameRecord> columnSingleGameRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final columnSingleGameRecord =
                          columnSingleGameRecordList.isNotEmpty
                              ? columnSingleGameRecordList.first
                              : null;

                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (columnSingleGameRecord?.player2ID != 'empty')
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      width: 382.4,
                                      height: 110.49,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        border: Border.all(
                                          color: Color(0xFF3C2100),
                                          width: 2.0,
                                        ),
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 4.0),
                                                  child: Text(
                                                    '1. Oyuncu',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFF3C2100),
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            columnSingleGameRecord
                                                                ?.player1Name,
                                                            'player1name',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            columnSingleGameRecord
                                                                ?.player1Point
                                                                ?.toString(),
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 10.0),
                                                    child: Container(
                                                      width: 120.0,
                                                      height: 55.0,
                                                      child: custom_widgets
                                                          .GeriSayac(
                                                        width: 120.0,
                                                        height: 55.0,
                                                        gameTime:
                                                            columnSingleGameRecord!
                                                                .gameTime,
                                                        sonHamle:
                                                            columnSingleGameRecord!
                                                                .lastMove,
                                                        playerTurn:
                                                            columnSingleGameRecord!
                                                                .currentPlayerTurn,
                                                        document:
                                                            columnSingleGameRecord!
                                                                .reference,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    valueOrDefault<String>(
                                                      () {
                                                        if ((columnSingleGameRecord
                                                                    ?.currentPlayerTurn ==
                                                                1) &&
                                                            (currentUserUid ==
                                                                columnSingleGameRecord
                                                                    ?.player1ID)) {
                                                          return 'Sıra Sizde';
                                                        } else if ((columnSingleGameRecord
                                                                    ?.currentPlayerTurn ==
                                                                2) &&
                                                            (currentUserUid ==
                                                                columnSingleGameRecord
                                                                    ?.player2ID)) {
                                                          return 'Sıra Sizde';
                                                        } else {
                                                          return 'Sıra Rakipte';
                                                        }
                                                      }(),
                                                      'Sıra Rakipte',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 4.0),
                                                  child: Text(
                                                    '2. Oyuncu',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFF3C2100),
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            columnSingleGameRecord
                                                                ?.player2Name,
                                                            'player2name',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            columnSingleGameRecord
                                                                ?.player2Point
                                                                ?.toString(),
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (((columnSingleGameRecord?.player2ID != 'empty') && (columnSingleGameRecord?.currentPlayerTurn == 2) && (currentUserUid == columnSingleGameRecord?.player1ID)) ||
                                      ((columnSingleGameRecord?.player2ID !=
                                              'empty') &&
                                          (columnSingleGameRecord
                                                  ?.currentPlayerTurn ==
                                              1) &&
                                          (currentUserUid ==
                                              columnSingleGameRecord
                                                  ?.player2ID)) ||
                                      (columnSingleGameRecord
                                              ?.currentPlayerTurn ==
                                          0))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 5.0, 5.0, 5.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF312100),
                                          borderRadius:
                                              BorderRadius.circular(9.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 5.0, 5.0, 5.0),
                                          child: StreamBuilder<
                                              List<SingleGameRecord>>(
                                            stream: querySingleGameRecord(
                                              queryBuilder:
                                                  (singleGameRecord) =>
                                                      singleGameRecord.where(
                                                'gameID',
                                                isEqualTo: widget!.oyunID,
                                              ),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<SingleGameRecord>
                                                  gridViewSingleGameRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final gridViewSingleGameRecord =
                                                  gridViewSingleGameRecordList
                                                          .isNotEmpty
                                                      ? gridViewSingleGameRecordList
                                                          .first
                                                      : null;

                                              return Builder(
                                                builder: (context) {
                                                  final everyLetter =
                                                      gridViewSingleGameRecord
                                                              ?.boardLetters
                                                              ?.map((e) => e)
                                                              .toList()
                                                              ?.take(225)
                                                              .toList()
                                                              ?.toList() ??
                                                          [];

                                                  return GridView.builder(
                                                    padding: EdgeInsets.zero,
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 15,
                                                      crossAxisSpacing: 2.0,
                                                      mainAxisSpacing: 2.0,
                                                      childAspectRatio: 1.0,
                                                    ),
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        everyLetter.length,
                                                    itemBuilder: (context,
                                                        everyLetterIndex) {
                                                      final everyLetterItem =
                                                          everyLetter[
                                                              everyLetterIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Sıra Sizde Değil, Lütfen Bekleyin',
                                                                style:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  Color(
                                                                      0xFF600D0E),
                                                            ),
                                                          );
                                                        },
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.05,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.05,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: everyLetterItem !=
                                                                    '*'
                                                                ? Color(
                                                                    0xFF493E36)
                                                                : valueOrDefault<
                                                                    Color>(
                                                                    functions
                                                                        .getColorForContainer(
                                                                            everyLetterIndex),
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x55000000),
                                                                offset: Offset(
                                                                  0.0,
                                                                  2.0,
                                                                ),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                            border: Border.all(
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                functions
                                                                    .getColorForContainer(
                                                                        everyLetterIndex),
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              if (everyLetterItem !=
                                                                  '*')
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          1.0,
                                                                          1.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Opacity(
                                                                            opacity:
                                                                                0.0,
                                                                            child:
                                                                                Text(
                                                                              '0',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF1B1414),
                                                                                    fontSize: 8.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    lineHeight: 1.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              functions
                                                                                  .getPointOfLetter(valueOrDefault<String>(
                                                                                    FFAppState().containerletters.elementAtOrNull(everyLetterIndex),
                                                                                    '0',
                                                                                  ))
                                                                                  .toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Colors.white,
                                                                                    fontSize: 8.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    lineHeight: 1.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              1.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            everyLetterItem,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: Colors.white,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  lineHeight: 0.5,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              if (everyLetterItem ==
                                                                  '*')
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          3.0,
                                                                          1.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Opacity(
                                                                            opacity:
                                                                                0.0,
                                                                            child:
                                                                                Text(
                                                                              '0',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    fontSize: 8.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    lineHeight: 1.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          if (functions.getEmptyBonusPoints(everyLetterIndex).toString() !=
                                                                              '0')
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                functions.getEmptyBonusPoints(everyLetterIndex).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xFF3D4142),
                                                                                      fontSize: 7.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      lineHeight: 1.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          functions
                                                                              .getEmptyBonusLetters(everyLetterIndex),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Color(0xFF3D4142),
                                                                                fontSize: 10.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                lineHeight: 0.5,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  if ((columnSingleGameRecord?.player2ID !=
                                          'empty') &&
                                      (columnSingleGameRecord
                                              ?.currentPlayerTurn ==
                                          1) &&
                                      (currentUserUid ==
                                          columnSingleGameRecord?.player1ID))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 5.0, 5.0, 5.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF312100),
                                          borderRadius:
                                              BorderRadius.circular(9.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 5.0, 5.0, 5.0),
                                          child: StreamBuilder<
                                              List<SingleGameRecord>>(
                                            stream: querySingleGameRecord(
                                              queryBuilder:
                                                  (singleGameRecord) =>
                                                      singleGameRecord.where(
                                                'gameID',
                                                isEqualTo: widget!.oyunID,
                                              ),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<SingleGameRecord>
                                                  gridViewSingleGameRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final gridViewSingleGameRecord =
                                                  gridViewSingleGameRecordList
                                                          .isNotEmpty
                                                      ? gridViewSingleGameRecordList
                                                          .first
                                                      : null;

                                              return Builder(
                                                builder: (context) {
                                                  final everyLetter =
                                                      gridViewSingleGameRecord
                                                              ?.taslakBoard1
                                                              ?.map((e) => e)
                                                              .toList()
                                                              ?.take(225)
                                                              .toList()
                                                              ?.toList() ??
                                                          [];

                                                  return GridView.builder(
                                                    padding: EdgeInsets.zero,
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 15,
                                                      crossAxisSpacing: 2.0,
                                                      mainAxisSpacing: 2.0,
                                                      childAspectRatio: 1.0,
                                                    ),
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        everyLetter.length,
                                                    itemBuilder: (context,
                                                        everyLetterIndex) {
                                                      final everyLetterItem =
                                                          everyLetter[
                                                              everyLetterIndex];
                                                      return Builder(
                                                        builder: (context) =>
                                                            InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if ((FFAppState()
                                                                            .selectedLetter !=
                                                                        null &&
                                                                    FFAppState()
                                                                            .selectedLetter !=
                                                                        '') &&
                                                                (FFAppState()
                                                                        .selectedPlayerIndex !=
                                                                    null)) {
                                                              if (gridViewSingleGameRecord
                                                                      ?.blockedSide ==
                                                                  0) {
                                                                if ((gridViewSingleGameRecord
                                                                        ?.boardLetters
                                                                        ?.elementAtOrNull(
                                                                            everyLetterIndex)) ==
                                                                    '*') {
                                                                  if ((gridViewSingleGameRecord
                                                                          ?.taslakBoard1
                                                                          ?.elementAtOrNull(
                                                                              everyLetterIndex)) ==
                                                                      '*') {
                                                                    FFAppState().containerletters = functions
                                                                        .getArrayAndSetAnIndex(
                                                                            everyLetterIndex,
                                                                            FFAppState()
                                                                                .selectedLetter,
                                                                            gridViewSingleGameRecord!.taslakBoard1
                                                                                .toList())
                                                                        .toList()
                                                                        .cast<
                                                                            String>();
                                                                    safeSetState(
                                                                        () {});

                                                                    await gridViewSingleGameRecord!
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'taslakBoard1': functions.getArrayAndSetAnIndex(
                                                                              everyLetterIndex,
                                                                              FFAppState().selectedLetter,
                                                                              gridViewSingleGameRecord!.taslakBoard1.toList()),
                                                                          'taslakLetters1': functions.deleteLetterFromArray(
                                                                              FFAppState().buTurJokerKullanildi ? '?' : FFAppState().selectedLetter,
                                                                              gridViewSingleGameRecord!.taslakLetters1.toList()),
                                                                        },
                                                                      ),
                                                                    });
                                                                    FFAppState()
                                                                        .selectedLetter = '';
                                                                    FFAppState()
                                                                        .selectedPlayerIndex = 0;
                                                                    safeSetState(
                                                                        () {});
                                                                  } else {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Dolu bir hücreye harf koymak için tahtayı sıfırlayın.',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            Color(0xFFFF0000),
                                                                      ),
                                                                    );
                                                                  }
                                                                }
                                                              } else {
                                                                if (gridViewSingleGameRecord
                                                                        ?.blockedSide ==
                                                                    1) {
                                                                  if (FFAppState()
                                                                      .solTarafListesi
                                                                      .contains(
                                                                          everyLetterIndex)) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                SolTarafYasakWidget(),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  } else {
                                                                    if ((gridViewSingleGameRecord
                                                                            ?.boardLetters
                                                                            ?.elementAtOrNull(everyLetterIndex)) ==
                                                                        '*') {
                                                                      if ((gridViewSingleGameRecord
                                                                              ?.taslakBoard1
                                                                              ?.elementAtOrNull(everyLetterIndex)) ==
                                                                          '*') {
                                                                        FFAppState().containerletters = functions
                                                                            .getArrayAndSetAnIndex(
                                                                                everyLetterIndex,
                                                                                FFAppState().selectedLetter,
                                                                                gridViewSingleGameRecord!.taslakBoard1.toList())
                                                                            .toList()
                                                                            .cast<String>();
                                                                        safeSetState(
                                                                            () {});

                                                                        await gridViewSingleGameRecord!
                                                                            .reference
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'taslakBoard1': functions.getArrayAndSetAnIndex(everyLetterIndex, FFAppState().selectedLetter, gridViewSingleGameRecord!.taslakBoard1.toList()),
                                                                              'taslakLetters1': functions.deleteLetterFromArray(FFAppState().buTurJokerKullanildi ? '?' : FFAppState().selectedLetter, gridViewSingleGameRecord!.taslakLetters1.toList()),
                                                                            },
                                                                          ),
                                                                        });
                                                                        FFAppState().selectedLetter =
                                                                            '';
                                                                        FFAppState()
                                                                            .selectedPlayerIndex = 0;
                                                                        safeSetState(
                                                                            () {});
                                                                      } else {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Dolu bir hücreye harf koymak için tahtayı sıfırlayın.',
                                                                              style: TextStyle(
                                                                                color: Colors.white,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                Color(0xFFFF0000),
                                                                          ),
                                                                        );
                                                                      }
                                                                    }
                                                                  }
                                                                } else {
                                                                  if (FFAppState()
                                                                      .sagTarafListesi
                                                                      .contains(
                                                                          everyLetterIndex)) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                SagTarafYasakWidget(),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  } else {
                                                                    if ((gridViewSingleGameRecord
                                                                            ?.boardLetters
                                                                            ?.elementAtOrNull(everyLetterIndex)) ==
                                                                        '*') {
                                                                      if ((gridViewSingleGameRecord
                                                                              ?.taslakBoard1
                                                                              ?.elementAtOrNull(everyLetterIndex)) ==
                                                                          '*') {
                                                                        FFAppState().containerletters = functions
                                                                            .getArrayAndSetAnIndex(
                                                                                everyLetterIndex,
                                                                                FFAppState().selectedLetter,
                                                                                gridViewSingleGameRecord!.taslakBoard1.toList())
                                                                            .toList()
                                                                            .cast<String>();
                                                                        safeSetState(
                                                                            () {});

                                                                        await gridViewSingleGameRecord!
                                                                            .reference
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'taslakBoard1': functions.getArrayAndSetAnIndex(everyLetterIndex, FFAppState().selectedLetter, gridViewSingleGameRecord!.taslakBoard1.toList()),
                                                                              'taslakLetters1': functions.deleteLetterFromArray(FFAppState().buTurJokerKullanildi ? '?' : FFAppState().selectedLetter, gridViewSingleGameRecord!.taslakLetters1.toList()),
                                                                            },
                                                                          ),
                                                                        });
                                                                        FFAppState().selectedLetter =
                                                                            '';
                                                                        FFAppState()
                                                                            .selectedPlayerIndex = 0;
                                                                        safeSetState(
                                                                            () {});
                                                                      } else {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Dolu bir hücreye harf koymak için tahtayı sıfırlayın.',
                                                                              style: TextStyle(
                                                                                color: Colors.white,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                Color(0xFFFF0000),
                                                                          ),
                                                                        );
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Lütfen Bir Harf Seçin.',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      Color(
                                                                          0xFFFF0000),
                                                                ),
                                                              );
                                                            }
                                                          },
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.05,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.05,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: everyLetterItem !=
                                                                      '*'
                                                                  ? Color(
                                                                      0xFF493E36)
                                                                  : valueOrDefault<
                                                                      Color>(
                                                                      functions
                                                                          .getColorForContainer(
                                                                              everyLetterIndex),
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      4.0,
                                                                  color: Color(
                                                                      0x55000000),
                                                                  offset:
                                                                      Offset(
                                                                    0.0,
                                                                    2.0,
                                                                  ),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.0),
                                                              border:
                                                                  Border.all(
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  functions
                                                                      .getColorForContainer(
                                                                          everyLetterIndex),
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                if (everyLetterItem !=
                                                                    '*')
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            1.0,
                                                                            1.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Opacity(
                                                                              opacity: 0.0,
                                                                              child: Text(
                                                                                '0',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xFF1B1414),
                                                                                      fontSize: 8.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      lineHeight: 1.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                functions
                                                                                    .getPointOfLetter(valueOrDefault<String>(
                                                                                      FFAppState().containerletters.elementAtOrNull(everyLetterIndex),
                                                                                      '0',
                                                                                    ))
                                                                                    .toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      fontSize: 8.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      lineHeight: 1.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                1.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              everyLetterItem,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Colors.white,
                                                                                    fontSize: 13.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    lineHeight: 0.5,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                if (everyLetterItem ==
                                                                    '*')
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            3.0,
                                                                            1.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Opacity(
                                                                              opacity: 0.0,
                                                                              child: Text(
                                                                                '0',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      fontSize: 8.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      lineHeight: 1.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            if (functions.getEmptyBonusPoints(everyLetterIndex).toString() !=
                                                                                '0')
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  functions.getEmptyBonusPoints(everyLetterIndex).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.normal,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xFF3D4142),
                                                                                        fontSize: 7.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        lineHeight: 1.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            functions.getEmptyBonusLetters(everyLetterIndex),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF3D4142),
                                                                                  fontSize: 10.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  lineHeight: 0.5,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  if ((columnSingleGameRecord?.player2ID !=
                                          'empty') &&
                                      (columnSingleGameRecord
                                              ?.currentPlayerTurn ==
                                          2) &&
                                      (currentUserUid ==
                                          columnSingleGameRecord?.player2ID))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 5.0, 5.0, 5.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF312100),
                                          borderRadius:
                                              BorderRadius.circular(9.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 5.0, 5.0, 5.0),
                                          child: StreamBuilder<
                                              List<SingleGameRecord>>(
                                            stream: querySingleGameRecord(
                                              queryBuilder:
                                                  (singleGameRecord) =>
                                                      singleGameRecord.where(
                                                'gameID',
                                                isEqualTo: widget!.oyunID,
                                              ),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<SingleGameRecord>
                                                  gridViewSingleGameRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final gridViewSingleGameRecord =
                                                  gridViewSingleGameRecordList
                                                          .isNotEmpty
                                                      ? gridViewSingleGameRecordList
                                                          .first
                                                      : null;

                                              return Builder(
                                                builder: (context) {
                                                  final everyLetter =
                                                      gridViewSingleGameRecord
                                                              ?.taslakBoard2
                                                              ?.map((e) => e)
                                                              .toList()
                                                              ?.take(225)
                                                              .toList()
                                                              ?.toList() ??
                                                          [];

                                                  return GridView.builder(
                                                    padding: EdgeInsets.zero,
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 15,
                                                      crossAxisSpacing: 2.0,
                                                      mainAxisSpacing: 2.0,
                                                      childAspectRatio: 1.0,
                                                    ),
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        everyLetter.length,
                                                    itemBuilder: (context,
                                                        everyLetterIndex) {
                                                      final everyLetterItem =
                                                          everyLetter[
                                                              everyLetterIndex];
                                                      return Builder(
                                                        builder: (context) =>
                                                            InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if ((FFAppState()
                                                                            .selectedLetter !=
                                                                        null &&
                                                                    FFAppState()
                                                                            .selectedLetter !=
                                                                        '') &&
                                                                (FFAppState()
                                                                        .selectedPlayerIndex !=
                                                                    null)) {
                                                              if (gridViewSingleGameRecord
                                                                      ?.blockedSide ==
                                                                  0) {
                                                                if ((gridViewSingleGameRecord
                                                                        ?.boardLetters
                                                                        ?.elementAtOrNull(
                                                                            everyLetterIndex)) ==
                                                                    '*') {
                                                                  if ((gridViewSingleGameRecord
                                                                          ?.taslakBoard2
                                                                          ?.elementAtOrNull(
                                                                              everyLetterIndex)) ==
                                                                      '*') {
                                                                    FFAppState().containerletters = functions
                                                                        .getArrayAndSetAnIndex(
                                                                            everyLetterIndex,
                                                                            FFAppState()
                                                                                .selectedLetter,
                                                                            gridViewSingleGameRecord!.taslakBoard2
                                                                                .toList())
                                                                        .toList()
                                                                        .cast<
                                                                            String>();
                                                                    safeSetState(
                                                                        () {});

                                                                    await gridViewSingleGameRecord!
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'taslakBoard2': functions.getArrayAndSetAnIndex(
                                                                              everyLetterIndex,
                                                                              FFAppState().selectedLetter,
                                                                              gridViewSingleGameRecord!.taslakBoard2.toList()),
                                                                          'taslakLetters2': functions.deleteLetterFromArray(
                                                                              FFAppState().buTurJokerKullanildi ? '?' : FFAppState().selectedLetter,
                                                                              gridViewSingleGameRecord!.taslakLetters2.toList()),
                                                                        },
                                                                      ),
                                                                    });
                                                                    FFAppState()
                                                                        .selectedLetter = '';
                                                                    FFAppState()
                                                                        .selectedPlayerIndex = 0;
                                                                    safeSetState(
                                                                        () {});
                                                                  } else {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Dolu bir hücreye harf koymak için tahtayı sıfırlayın.',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            Color(0xFFFF0000),
                                                                      ),
                                                                    );
                                                                  }
                                                                }
                                                              } else {
                                                                if (gridViewSingleGameRecord
                                                                        ?.blockedSide ==
                                                                    1) {
                                                                  if (FFAppState()
                                                                      .solTarafListesi
                                                                      .contains(
                                                                          everyLetterIndex)) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                SolTarafYasakWidget(),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  } else {
                                                                    if ((gridViewSingleGameRecord
                                                                            ?.boardLetters
                                                                            ?.elementAtOrNull(everyLetterIndex)) ==
                                                                        '*') {
                                                                      if ((gridViewSingleGameRecord
                                                                              ?.taslakBoard2
                                                                              ?.elementAtOrNull(everyLetterIndex)) ==
                                                                          '*') {
                                                                        FFAppState().containerletters = functions
                                                                            .getArrayAndSetAnIndex(
                                                                                everyLetterIndex,
                                                                                FFAppState().selectedLetter,
                                                                                gridViewSingleGameRecord!.taslakBoard2.toList())
                                                                            .toList()
                                                                            .cast<String>();
                                                                        safeSetState(
                                                                            () {});

                                                                        await gridViewSingleGameRecord!
                                                                            .reference
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'taslakBoard2': functions.getArrayAndSetAnIndex(everyLetterIndex, FFAppState().selectedLetter, gridViewSingleGameRecord!.taslakBoard2.toList()),
                                                                              'taslakLetters2': functions.deleteLetterFromArray(FFAppState().buTurJokerKullanildi ? '?' : FFAppState().selectedLetter, gridViewSingleGameRecord!.taslakLetters2.toList()),
                                                                            },
                                                                          ),
                                                                        });
                                                                        FFAppState().selectedLetter =
                                                                            '';
                                                                        FFAppState()
                                                                            .selectedPlayerIndex = 0;
                                                                        safeSetState(
                                                                            () {});
                                                                      } else {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Dolu bir hücreye harf koymak için tahtayı sıfırlayın.',
                                                                              style: TextStyle(
                                                                                color: Colors.white,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                Color(0xFFFF0000),
                                                                          ),
                                                                        );
                                                                      }
                                                                    }
                                                                  }
                                                                } else {
                                                                  if (FFAppState()
                                                                      .sagTarafListesi
                                                                      .contains(
                                                                          everyLetterIndex)) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                SagTarafYasakWidget(),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  } else {
                                                                    if ((gridViewSingleGameRecord
                                                                            ?.boardLetters
                                                                            ?.elementAtOrNull(everyLetterIndex)) ==
                                                                        '*') {
                                                                      if ((gridViewSingleGameRecord
                                                                              ?.taslakBoard2
                                                                              ?.elementAtOrNull(everyLetterIndex)) ==
                                                                          '*') {
                                                                        FFAppState().containerletters = functions
                                                                            .getArrayAndSetAnIndex(
                                                                                everyLetterIndex,
                                                                                FFAppState().selectedLetter,
                                                                                gridViewSingleGameRecord!.taslakBoard2.toList())
                                                                            .toList()
                                                                            .cast<String>();
                                                                        safeSetState(
                                                                            () {});

                                                                        await gridViewSingleGameRecord!
                                                                            .reference
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'taslakBoard2': functions.getArrayAndSetAnIndex(everyLetterIndex, FFAppState().selectedLetter, gridViewSingleGameRecord!.taslakBoard2.toList()),
                                                                              'taslakLetters2': functions.deleteLetterFromArray(FFAppState().buTurJokerKullanildi ? '?' : FFAppState().selectedLetter, gridViewSingleGameRecord!.taslakLetters2.toList()),
                                                                            },
                                                                          ),
                                                                        });
                                                                        FFAppState().selectedLetter =
                                                                            '';
                                                                        FFAppState()
                                                                            .selectedPlayerIndex = 0;
                                                                        safeSetState(
                                                                            () {});
                                                                      } else {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Dolu bir hücreye harf koymak için tahtayı sıfırlayın.',
                                                                              style: TextStyle(
                                                                                color: Colors.white,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                Color(0xFFFF0000),
                                                                          ),
                                                                        );
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Lütfen Bir Harf Seçin.',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      Color(
                                                                          0xFFFF0000),
                                                                ),
                                                              );
                                                            }
                                                          },
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.05,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.05,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: everyLetterItem !=
                                                                      '*'
                                                                  ? Color(
                                                                      0xFF493E36)
                                                                  : valueOrDefault<
                                                                      Color>(
                                                                      functions
                                                                          .getColorForContainer(
                                                                              everyLetterIndex),
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      4.0,
                                                                  color: Color(
                                                                      0x55000000),
                                                                  offset:
                                                                      Offset(
                                                                    0.0,
                                                                    2.0,
                                                                  ),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.0),
                                                              border:
                                                                  Border.all(
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  functions
                                                                      .getColorForContainer(
                                                                          everyLetterIndex),
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                if (everyLetterItem !=
                                                                    '*')
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            1.0,
                                                                            1.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Opacity(
                                                                              opacity: 0.0,
                                                                              child: Text(
                                                                                '0',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xFF1B1414),
                                                                                      fontSize: 8.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      lineHeight: 1.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                functions
                                                                                    .getPointOfLetter(valueOrDefault<String>(
                                                                                      FFAppState().containerletters.elementAtOrNull(everyLetterIndex),
                                                                                      '0',
                                                                                    ))
                                                                                    .toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      fontSize: 8.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      lineHeight: 1.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                1.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              everyLetterItem,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Colors.white,
                                                                                    fontSize: 13.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    lineHeight: 0.5,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                if (everyLetterItem ==
                                                                    '*')
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            3.0,
                                                                            1.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Opacity(
                                                                              opacity: 0.0,
                                                                              child: Text(
                                                                                '0',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      fontSize: 8.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      lineHeight: 1.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            if (functions.getEmptyBonusPoints(everyLetterIndex).toString() !=
                                                                                '0')
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  functions.getEmptyBonusPoints(everyLetterIndex).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.normal,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xFF3D4142),
                                                                                        fontSize: 7.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        lineHeight: 1.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            functions.getEmptyBonusLetters(everyLetterIndex),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF3D4142),
                                                                                  fontSize: 10.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  lineHeight: 0.5,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  if ((currentUserUid ==
                                          columnSingleGameRecord?.player1ID) &&
                                      (columnSingleGameRecord
                                              ?.currentPlayerTurn ==
                                          1))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await columnSingleGameRecord!
                                                  .reference
                                                  .update({
                                                ...createSingleGameRecordData(
                                                  gameStatus: 2,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'taslakBoard1':
                                                        columnSingleGameRecord
                                                            ?.boardLetters,
                                                    'taslakLetters1':
                                                        columnSingleGameRecord
                                                            ?.player1Letters,
                                                  },
                                                ),
                                              });
                                              FFAppState()
                                                  .buTurJokerKullanildi = false;
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: 50.0,
                                              height: 43.9,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF312100),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'FF',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await columnSingleGameRecord!
                                                  .reference
                                                  .update({
                                                ...createSingleGameRecordData(
                                                  currentPlayerTurn: 2,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'taslakBoard1':
                                                        columnSingleGameRecord
                                                            ?.boardLetters,
                                                    'taslakLetters1':
                                                        columnSingleGameRecord
                                                            ?.player1Letters,
                                                  },
                                                ),
                                              });
                                              FFAppState()
                                                  .buTurJokerKullanildi = false;
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: 50.0,
                                              height: 43.9,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF312100),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'Pas',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await columnSingleGameRecord!
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'taslakBoard1':
                                                        columnSingleGameRecord
                                                            ?.boardLetters,
                                                    'taslakLetters1':
                                                        columnSingleGameRecord
                                                            ?.player1Letters,
                                                  },
                                                ),
                                              });
                                              FFAppState()
                                                  .buTurJokerKullanildi = false;
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: 130.0,
                                              height: 43.9,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF312100),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'Tahtayı Sıfırla',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) => InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                var _shouldSetState = false;
                                                if (functions
                                                        .yeniKelimeleriKontrolEt(
                                                            columnSingleGameRecord!
                                                                .taslakBoard1
                                                                .toList(),
                                                            columnSingleGameRecord!
                                                                .boardLetters
                                                                .toList())
                                                        .firstOrNull !=
                                                    'wrongplacement') {
                                                  if (functions.butunYeniIndexlerBagliMi(
                                                      columnSingleGameRecord!
                                                          .taslakBoard1
                                                          .toList(),
                                                      functions
                                                          .yeniHarfleriTespit(
                                                              columnSingleGameRecord!
                                                                  .taslakBoard1
                                                                  .toList(),
                                                              columnSingleGameRecord!
                                                                  .boardLetters
                                                                  .toList())
                                                          .toList())) {
                                                    FFAppState().yeniKelimeler = functions
                                                        .yeniKelimeleriKontrolEt(
                                                            columnSingleGameRecord!
                                                                .taslakBoard1
                                                                .toList(),
                                                            columnSingleGameRecord!
                                                                .boardLetters
                                                                .toList())
                                                        .toList()
                                                        .cast<String>();
                                                    safeSetState(() {});

                                                    await columnSingleGameRecord!
                                                        .reference
                                                        .update(
                                                            createSingleGameRecordData(
                                                      player1blocked: false,
                                                      blockedSide: 0,
                                                    ));
                                                    if (FFAppState().testModu) {
                                                      FFAppState().yeniKelimeler = functions
                                                          .yeniKelimeleriKontrolEt(
                                                              columnSingleGameRecord!
                                                                  .taslakBoard1
                                                                  .toList(),
                                                              columnSingleGameRecord!
                                                                  .boardLetters
                                                                  .toList())
                                                          .toList()
                                                          .cast<String>();
                                                      FFAppState().eklenecekHarfler = functions
                                                          .yeniHarflerinListesiniVer(
                                                              columnSingleGameRecord!
                                                                  .usedLetters
                                                                  .toList(),
                                                              functions
                                                                  .kullanilanHarflerSilindi(
                                                                      columnSingleGameRecord!
                                                                          .boardLetters
                                                                          .toList(),
                                                                      columnSingleGameRecord!
                                                                          .taslakBoard1
                                                                          .toList(),
                                                                      columnSingleGameRecord!
                                                                          .player1Letters
                                                                          .toList())
                                                                  .toList())
                                                          .toList()
                                                          .cast<String>();
                                                      FFAppState().newIndexes = functions
                                                          .yeniHarfleriTespit(
                                                              columnSingleGameRecord!
                                                                  .taslakBoard1
                                                                  .toList(),
                                                              columnSingleGameRecord!
                                                                  .boardLetters
                                                                  .toList())
                                                          .toList()
                                                          .cast<int>();
                                                      safeSetState(() {});
                                                      FFAppState()
                                                              .turBonuslari =
                                                          functions
                                                              .didPlayerGetBonus(
                                                                  columnSingleGameRecord!
                                                                      .indexlerBonuslari
                                                                      .toList(),
                                                                  FFAppState()
                                                                      .newIndexes
                                                                      .toList())
                                                              .toList()
                                                              .cast<String>();
                                                      safeSetState(() {});

                                                      await columnSingleGameRecord!
                                                          .reference
                                                          .update({
                                                        ...createSingleGameRecordData(
                                                          lastMove:
                                                              getCurrentTimestamp
                                                                  .secondsSinceEpoch,
                                                          timeOut: functions
                                                              .timeOutDegeriHesapla(
                                                                  getCurrentTimestamp
                                                                      .millisecondsSinceEpoch,
                                                                  columnSingleGameRecord!
                                                                      .gameTime),
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'player1Letters': functions.mergeStringList(
                                                                functions
                                                                    .kullanilanHarflerSilindi(
                                                                        columnSingleGameRecord!
                                                                            .boardLetters
                                                                            .toList(),
                                                                        columnSingleGameRecord!
                                                                            .taslakBoard1
                                                                            .toList(),
                                                                        columnSingleGameRecord!
                                                                            .player1Letters
                                                                            .toList())
                                                                    .toList(),
                                                                FFAppState()
                                                                    .eklenecekHarfler
                                                                    .toList()),
                                                            'usedLetters': functions.mergeStringList(
                                                                columnSingleGameRecord!
                                                                    .usedLetters
                                                                    .toList(),
                                                                FFAppState()
                                                                    .eklenecekHarfler
                                                                    .toList()),
                                                            'taslakLetters1': functions.mergeStringList(
                                                                functions
                                                                    .kullanilanHarflerSilindi(
                                                                        columnSingleGameRecord!
                                                                            .boardLetters
                                                                            .toList(),
                                                                        columnSingleGameRecord!
                                                                            .taslakBoard1
                                                                            .toList(),
                                                                        columnSingleGameRecord!
                                                                            .player1Letters
                                                                            .toList())
                                                                    .toList(),
                                                                FFAppState()
                                                                    .eklenecekHarfler
                                                                    .toList()),
                                                          },
                                                        ),
                                                      });

                                                      await columnSingleGameRecord!
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'boardLetters':
                                                                columnSingleGameRecord
                                                                    ?.taslakBoard1,
                                                          },
                                                        ),
                                                      });

                                                      await columnSingleGameRecord!
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'player1Point': FieldValue.increment(functions.eklenecekPuanHesaplama(
                                                                columnSingleGameRecord!
                                                                    .taslakBoard1
                                                                    .toList(),
                                                                FFAppState()
                                                                    .newIndexes
                                                                    .toList(),
                                                                functions
                                                                    .puanBolunmesiDenkGelenler(
                                                                        columnSingleGameRecord!
                                                                            .indexlerBonuslari
                                                                            .toList(),
                                                                        FFAppState()
                                                                            .newIndexes
                                                                            .toList())
                                                                    .toList())),
                                                          },
                                                        ),
                                                      });
                                                      if (FFAppState()
                                                          .turBonuslari
                                                          .isNotEmpty) {
                                                        if (FFAppState()
                                                            .turBonuslari
                                                            .contains(
                                                                'Puan Transferi')) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      PuanTransferiWidget(
                                                                    aktarilanPuan: functions.eklenecekPuanHesaplama(
                                                                        columnSingleGameRecord!
                                                                            .taslakBoard1
                                                                            .toList(),
                                                                        functions
                                                                            .puanTransferiDenkGelenler(columnSingleGameRecord!.indexlerBonuslari.toList(),
                                                                                FFAppState().newIndexes.toList())
                                                                            .toList(),
                                                                        functions.puanBolunmesiDenkGelenler(columnSingleGameRecord!.indexlerBonuslari.toList(), FFAppState().newIndexes.toList()).toList()),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );

                                                          await columnSingleGameRecord!
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'player1Point': FieldValue.increment(-(functions.eklenecekPuanHesaplama(
                                                                    columnSingleGameRecord!
                                                                        .taslakBoard1
                                                                        .toList(),
                                                                    functions
                                                                        .puanTransferiDenkGelenler(
                                                                            columnSingleGameRecord!.indexlerBonuslari
                                                                                .toList(),
                                                                            FFAppState()
                                                                                .newIndexes
                                                                                .toList())
                                                                        .toList(),
                                                                    functions
                                                                        .puanBolunmesiDenkGelenler(
                                                                            columnSingleGameRecord!.indexlerBonuslari.toList(),
                                                                            FFAppState().newIndexes.toList())
                                                                        .toList()))),
                                                                'player2Point': FieldValue.increment(functions.eklenecekPuanHesaplama(
                                                                    columnSingleGameRecord!
                                                                        .taslakBoard1
                                                                        .toList(),
                                                                    functions
                                                                        .puanTransferiDenkGelenler(
                                                                            columnSingleGameRecord!.indexlerBonuslari
                                                                                .toList(),
                                                                            FFAppState()
                                                                                .newIndexes
                                                                                .toList())
                                                                        .toList(),
                                                                    functions
                                                                        .puanBolunmesiDenkGelenler(
                                                                            columnSingleGameRecord!.indexlerBonuslari.toList(),
                                                                            FFAppState().newIndexes.toList())
                                                                        .toList())),
                                                              },
                                                            ),
                                                          });
                                                        }
                                                        if (FFAppState()
                                                            .turBonuslari
                                                            .contains(
                                                                'Harf Kaybı')) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      HarfKaybiWidget(),
                                                                ),
                                                              );
                                                            },
                                                          );

                                                          FFAppState().harfKaybiYeniHarfler = functions
                                                              .yeniHarflerinListesiniVer(
                                                                  columnSingleGameRecord!
                                                                      .usedLetters
                                                                      .toList(),
                                                                  functions
                                                                      .setEmptyStringList()
                                                                      .toList())
                                                              .toList()
                                                              .cast<String>();
                                                          safeSetState(() {});

                                                          await columnSingleGameRecord!
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'player1Letters':
                                                                    FFAppState()
                                                                        .harfKaybiYeniHarfler,
                                                                'taslakLetters1':
                                                                    FFAppState()
                                                                        .harfKaybiYeniHarfler,
                                                              },
                                                            ),
                                                          });
                                                        }
                                                        if (FFAppState()
                                                            .turBonuslari
                                                            .contains(
                                                                'Ekstra Hamle Engeli')) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      BonusIptaliWidget(
                                                                    iptalEdilenPuanBonusu: functions.eklenecekPuanHesaplama(
                                                                            columnSingleGameRecord!.taslakBoard1.toList(),
                                                                            functions.ekstraHamleEngeliDenkGelenler(columnSingleGameRecord!.indexlerBonuslari.toList(), FFAppState().newIndexes.toList()).toList(),
                                                                            functions.puanBolunmesiDenkGelenler(columnSingleGameRecord!.indexlerBonuslari.toList(), FFAppState().newIndexes.toList()).toList()) -
                                                                        functions.bonussuzEklenecekPuanHesaplama(columnSingleGameRecord!.taslakBoard1.toList(), functions.ekstraHamleEngeliDenkGelenler(columnSingleGameRecord!.indexlerBonuslari.toList(), FFAppState().newIndexes.toList()).toList()),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );

                                                          await columnSingleGameRecord!
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'player1Point': FieldValue.increment(-(functions.eklenecekPuanHesaplama(
                                                                        columnSingleGameRecord!
                                                                            .taslakBoard1
                                                                            .toList(),
                                                                        functions
                                                                            .ekstraHamleEngeliDenkGelenler(
                                                                                columnSingleGameRecord!.indexlerBonuslari
                                                                                    .toList(),
                                                                                FFAppState()
                                                                                    .newIndexes
                                                                                    .toList())
                                                                            .toList(),
                                                                        functions
                                                                            .puanBolunmesiDenkGelenler(
                                                                                columnSingleGameRecord!.indexlerBonuslari
                                                                                    .toList(),
                                                                                FFAppState()
                                                                                    .newIndexes
                                                                                    .toList())
                                                                            .toList()) -
                                                                    functions.bonussuzEklenecekPuanHesaplama(
                                                                        columnSingleGameRecord!
                                                                            .taslakBoard1
                                                                            .toList(),
                                                                        functions
                                                                            .ekstraHamleEngeliDenkGelenler(columnSingleGameRecord!.indexlerBonuslari.toList(),
                                                                                FFAppState().newIndexes.toList())
                                                                            .toList()))),
                                                              },
                                                            ),
                                                          });
                                                        }
                                                        if (FFAppState()
                                                            .turBonuslari
                                                            .contains(
                                                                'Kelime İptali')) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      KelimeIptaliWidget(),
                                                                ),
                                                              );
                                                            },
                                                          );

                                                          await columnSingleGameRecord!
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'player1Point': FieldValue.increment(-(functions.eklenecekPuanHesaplama(
                                                                    columnSingleGameRecord!
                                                                        .taslakBoard1
                                                                        .toList(),
                                                                    functions
                                                                        .kelimeIptaliDenkGelenler(
                                                                            columnSingleGameRecord!.indexlerBonuslari
                                                                                .toList(),
                                                                            FFAppState()
                                                                                .newIndexes
                                                                                .toList())
                                                                        .toList(),
                                                                    functions
                                                                        .puanBolunmesiDenkGelenler(
                                                                            columnSingleGameRecord!.indexlerBonuslari.toList(),
                                                                            FFAppState().newIndexes.toList())
                                                                        .toList()))),
                                                              },
                                                            ),
                                                          });
                                                        }
                                                        if (FFAppState()
                                                            .turBonuslari
                                                            .contains(
                                                                'Harf Yasağı')) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      HarfYasagiWidget(),
                                                                ),
                                                              );
                                                            },
                                                          );

                                                          if (FFAppState()
                                                              .donduracakMi) {
                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update(
                                                                    createSingleGameRecordData(
                                                              player2blocked:
                                                                  true,
                                                            ));
                                                          } else {
                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update(
                                                                    createSingleGameRecordData(
                                                              player2blocked:
                                                                  false,
                                                            ));
                                                          }
                                                        }
                                                        if (FFAppState()
                                                            .turBonuslari
                                                            .contains(
                                                                'Bölge Yasağı')) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      BolgeYasagiWidget(),
                                                                ),
                                                              );
                                                            },
                                                          );

                                                          await columnSingleGameRecord!
                                                              .reference
                                                              .update(
                                                                  createSingleGameRecordData(
                                                            blockedSide:
                                                                FFAppState()
                                                                    .hangiBolgeBanlansin,
                                                          ));
                                                        }
                                                        if (FFAppState()
                                                            .turBonuslari
                                                            .contains(
                                                                'Ekstra Hamle Jokeri')) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      EkstraHarfJokeriWidget(),
                                                                ),
                                                              );
                                                            },
                                                          );

                                                          if (FFAppState()
                                                              .ekstraIsterMi) {
                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update(
                                                                    createSingleGameRecordData(
                                                              currentPlayerTurn:
                                                                  1,
                                                            ));
                                                          } else {
                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update(
                                                                    createSingleGameRecordData(
                                                              currentPlayerTurn:
                                                                  2,
                                                            ));
                                                          }
                                                        } else {
                                                          await columnSingleGameRecord!
                                                              .reference
                                                              .update(
                                                                  createSingleGameRecordData(
                                                            currentPlayerTurn:
                                                                2,
                                                          ));
                                                        }

                                                        if (columnSingleGameRecord!
                                                            .taslakLetters1
                                                            .isNotEmpty) {
                                                          await columnSingleGameRecord!
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'taslakBoard2':
                                                                    columnSingleGameRecord
                                                                        ?.boardLetters,
                                                                'taslakBoard1':
                                                                    columnSingleGameRecord
                                                                        ?.boardLetters,
                                                              },
                                                            ),
                                                          });
                                                          FFAppState()
                                                              .selectedLetter = '';
                                                          FFAppState()
                                                              .selectedPlayerIndex = 0;
                                                          FFAppState()
                                                                  .donduracakMi =
                                                              true;
                                                          FFAppState()
                                                                  .ekstraIsterMi =
                                                              true;
                                                          safeSetState(() {});
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        } else {
                                                          await columnSingleGameRecord!
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'player1Point':
                                                                    FieldValue.increment(
                                                                        valueOrDefault<
                                                                            int>(
                                                                  functions.oyuncu1HarfleriBitti(
                                                                      columnSingleGameRecord!
                                                                          .taslakLetters2
                                                                          .toList()),
                                                                  0,
                                                                )),
                                                                'player2Point':
                                                                    FieldValue.increment(
                                                                        -(valueOrDefault<
                                                                            int>(
                                                                  functions.oyuncu1HarfleriBitti(
                                                                      columnSingleGameRecord!
                                                                          .taslakLetters2
                                                                          .toList()),
                                                                  0,
                                                                ))),
                                                              },
                                                            ),
                                                          });
                                                          await Future.delayed(
                                                              const Duration(
                                                                  milliseconds:
                                                                      1000));

                                                          await columnSingleGameRecord!
                                                              .reference
                                                              .update(
                                                                  createSingleGameRecordData(
                                                            gameStatus: () {
                                                              if (columnSingleGameRecord!
                                                                      .player1Point >
                                                                  columnSingleGameRecord!
                                                                      .player2Point) {
                                                                return 1;
                                                              } else if (columnSingleGameRecord
                                                                      ?.player1Point ==
                                                                  columnSingleGameRecord
                                                                      ?.player2Point) {
                                                                return 3;
                                                              } else {
                                                                return 2;
                                                              }
                                                            }(),
                                                          ));
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        }
                                                      } else {
                                                        if (columnSingleGameRecord!
                                                            .taslakLetters1
                                                            .isNotEmpty) {
                                                          await columnSingleGameRecord!
                                                              .reference
                                                              .update(
                                                                  createSingleGameRecordData(
                                                            currentPlayerTurn:
                                                                2,
                                                          ));

                                                          await columnSingleGameRecord!
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'taslakBoard2':
                                                                    columnSingleGameRecord
                                                                        ?.boardLetters,
                                                                'taslakBoard1':
                                                                    columnSingleGameRecord
                                                                        ?.boardLetters,
                                                              },
                                                            ),
                                                          });
                                                          FFAppState()
                                                              .selectedLetter = '';
                                                          FFAppState()
                                                              .selectedPlayerIndex = 0;
                                                          FFAppState()
                                                                  .donduracakMi =
                                                              true;
                                                          FFAppState()
                                                                  .ekstraIsterMi =
                                                              true;
                                                          safeSetState(() {});
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        } else {
                                                          await columnSingleGameRecord!
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'player1Point':
                                                                    FieldValue.increment(
                                                                        valueOrDefault<
                                                                            int>(
                                                                  functions.oyuncu1HarfleriBitti(
                                                                      columnSingleGameRecord!
                                                                          .taslakLetters2
                                                                          .toList()),
                                                                  0,
                                                                )),
                                                                'player2Point':
                                                                    FieldValue.increment(
                                                                        -(valueOrDefault<
                                                                            int>(
                                                                  functions.oyuncu1HarfleriBitti(
                                                                      columnSingleGameRecord!
                                                                          .taslakLetters2
                                                                          .toList()),
                                                                  0,
                                                                ))),
                                                              },
                                                            ),
                                                          });
                                                          await Future.delayed(
                                                              const Duration(
                                                                  milliseconds:
                                                                      1000));

                                                          await columnSingleGameRecord!
                                                              .reference
                                                              .update(
                                                                  createSingleGameRecordData(
                                                            gameStatus: () {
                                                              if (columnSingleGameRecord!
                                                                      .player1Point >
                                                                  columnSingleGameRecord!
                                                                      .player2Point) {
                                                                return 1;
                                                              } else if (columnSingleGameRecord
                                                                      ?.player1Point ==
                                                                  columnSingleGameRecord
                                                                      ?.player2Point) {
                                                                return 3;
                                                              } else {
                                                                return 2;
                                                              }
                                                            }(),
                                                          ));
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        }
                                                      }
                                                    } else {
                                                      _model.jsonFile =
                                                          await actions
                                                              .initializeJSON(
                                                        'kelimeler',
                                                      );
                                                      _shouldSetState = true;
                                                    }

                                                    if (!(functions
                                                        .legitOlmayanKelimeler(
                                                            FFAppState()
                                                                .yeniKelimeler
                                                                .toList(),
                                                            _model.jsonFile!)
                                                        .isNotEmpty)) {
                                                      FFAppState().yeniKelimeler = functions
                                                          .yeniKelimeleriKontrolEt(
                                                              columnSingleGameRecord!
                                                                  .taslakBoard1
                                                                  .toList(),
                                                              columnSingleGameRecord!
                                                                  .boardLetters
                                                                  .toList())
                                                          .toList()
                                                          .cast<String>();
                                                      FFAppState().eklenecekHarfler = functions
                                                          .yeniHarflerinListesiniVer(
                                                              columnSingleGameRecord!
                                                                  .usedLetters
                                                                  .toList(),
                                                              functions
                                                                  .kullanilanHarflerSilindi(
                                                                      columnSingleGameRecord!
                                                                          .boardLetters
                                                                          .toList(),
                                                                      columnSingleGameRecord!
                                                                          .taslakBoard1
                                                                          .toList(),
                                                                      columnSingleGameRecord!
                                                                          .player1Letters
                                                                          .toList())
                                                                  .toList())
                                                          .toList()
                                                          .cast<String>();
                                                      FFAppState().newIndexes = functions
                                                          .yeniHarfleriTespit(
                                                              columnSingleGameRecord!
                                                                  .taslakBoard1
                                                                  .toList(),
                                                              columnSingleGameRecord!
                                                                  .boardLetters
                                                                  .toList())
                                                          .toList()
                                                          .cast<int>();
                                                      safeSetState(() {});
                                                      FFAppState()
                                                              .turBonuslari =
                                                          functions
                                                              .didPlayerGetBonus(
                                                                  columnSingleGameRecord!
                                                                      .indexlerBonuslari
                                                                      .toList(),
                                                                  FFAppState()
                                                                      .newIndexes
                                                                      .toList())
                                                              .toList()
                                                              .cast<String>();
                                                      safeSetState(() {});

                                                      await columnSingleGameRecord!
                                                          .reference
                                                          .update({
                                                        ...createSingleGameRecordData(
                                                          lastMove:
                                                              getCurrentTimestamp
                                                                  .secondsSinceEpoch,
                                                          timeOut: functions
                                                              .timeOutDegeriHesapla(
                                                                  getCurrentTimestamp
                                                                      .millisecondsSinceEpoch,
                                                                  columnSingleGameRecord!
                                                                      .gameTime),
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'player1Letters': functions.mergeStringList(
                                                                functions
                                                                    .kullanilanHarflerSilindi(
                                                                        columnSingleGameRecord!
                                                                            .boardLetters
                                                                            .toList(),
                                                                        columnSingleGameRecord!
                                                                            .taslakBoard1
                                                                            .toList(),
                                                                        columnSingleGameRecord!
                                                                            .player1Letters
                                                                            .toList())
                                                                    .toList(),
                                                                FFAppState()
                                                                    .eklenecekHarfler
                                                                    .toList()),
                                                            'usedLetters': functions.mergeStringList(
                                                                columnSingleGameRecord!
                                                                    .usedLetters
                                                                    .toList(),
                                                                FFAppState()
                                                                    .eklenecekHarfler
                                                                    .toList()),
                                                            'taslakLetters1': functions.mergeStringList(
                                                                functions
                                                                    .kullanilanHarflerSilindi(
                                                                        columnSingleGameRecord!
                                                                            .boardLetters
                                                                            .toList(),
                                                                        columnSingleGameRecord!
                                                                            .taslakBoard1
                                                                            .toList(),
                                                                        columnSingleGameRecord!
                                                                            .player1Letters
                                                                            .toList())
                                                                    .toList(),
                                                                FFAppState()
                                                                    .eklenecekHarfler
                                                                    .toList()),
                                                          },
                                                        ),
                                                      });

                                                      await columnSingleGameRecord!
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'boardLetters':
                                                                columnSingleGameRecord
                                                                    ?.taslakBoard1,
                                                          },
                                                        ),
                                                      });

                                                      await columnSingleGameRecord!
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'player1Point': FieldValue.increment(functions.eklenecekPuanHesaplama(
                                                                columnSingleGameRecord!
                                                                    .taslakBoard1
                                                                    .toList(),
                                                                FFAppState()
                                                                    .newIndexes
                                                                    .toList(),
                                                                functions
                                                                    .puanBolunmesiDenkGelenler(
                                                                        columnSingleGameRecord!
                                                                            .indexlerBonuslari
                                                                            .toList(),
                                                                        FFAppState()
                                                                            .newIndexes
                                                                            .toList())
                                                                    .toList())),
                                                          },
                                                        ),
                                                      });
                                                      if (FFAppState()
                                                          .turBonuslari
                                                          .isNotEmpty) {
                                                        if (FFAppState()
                                                            .turBonuslari
                                                            .contains(
                                                                'Puan Transferi')) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      PuanTransferiWidget(
                                                                    aktarilanPuan: functions.eklenecekPuanHesaplama(
                                                                        columnSingleGameRecord!
                                                                            .taslakBoard1
                                                                            .toList(),
                                                                        functions
                                                                            .puanTransferiDenkGelenler(columnSingleGameRecord!.indexlerBonuslari.toList(),
                                                                                FFAppState().newIndexes.toList())
                                                                            .toList(),
                                                                        functions.puanBolunmesiDenkGelenler(columnSingleGameRecord!.indexlerBonuslari.toList(), FFAppState().newIndexes.toList()).toList()),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );

                                                          await columnSingleGameRecord!
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'player1Point': FieldValue.increment(-(functions.eklenecekPuanHesaplama(
                                                                    columnSingleGameRecord!
                                                                        .taslakBoard1
                                                                        .toList(),
                                                                    functions
                                                                        .puanTransferiDenkGelenler(
                                                                            columnSingleGameRecord!.indexlerBonuslari
                                                                                .toList(),
                                                                            FFAppState()
                                                                                .newIndexes
                                                                                .toList())
                                                                        .toList(),
                                                                    functions
                                                                        .puanBolunmesiDenkGelenler(
                                                                            columnSingleGameRecord!.indexlerBonuslari.toList(),
                                                                            FFAppState().newIndexes.toList())
                                                                        .toList()))),
                                                                'player2Point': FieldValue.increment(functions.eklenecekPuanHesaplama(
                                                                    columnSingleGameRecord!
                                                                        .taslakBoard1
                                                                        .toList(),
                                                                    functions
                                                                        .puanTransferiDenkGelenler(
                                                                            columnSingleGameRecord!.indexlerBonuslari
                                                                                .toList(),
                                                                            FFAppState()
                                                                                .newIndexes
                                                                                .toList())
                                                                        .toList(),
                                                                    functions
                                                                        .puanBolunmesiDenkGelenler(
                                                                            columnSingleGameRecord!.indexlerBonuslari.toList(),
                                                                            FFAppState().newIndexes.toList())
                                                                        .toList())),
                                                              },
                                                            ),
                                                          });
                                                        }
                                                        if (FFAppState()
                                                            .turBonuslari
                                                            .contains(
                                                                'Harf Kaybı')) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      HarfKaybiWidget(),
                                                                ),
                                                              );
                                                            },
                                                          );

                                                          FFAppState().harfKaybiYeniHarfler = functions
                                                              .yeniHarflerinListesiniVer(
                                                                  columnSingleGameRecord!
                                                                      .usedLetters
                                                                      .toList(),
                                                                  functions
                                                                      .setEmptyStringList()
                                                                      .toList())
                                                              .toList()
                                                              .cast<String>();
                                                          safeSetState(() {});

                                                          await columnSingleGameRecord!
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'player1Letters':
                                                                    FFAppState()
                                                                        .harfKaybiYeniHarfler,
                                                                'taslakLetters1':
                                                                    FFAppState()
                                                                        .harfKaybiYeniHarfler,
                                                              },
                                                            ),
                                                          });
                                                        }
                                                        if (FFAppState()
                                                            .turBonuslari
                                                            .contains(
                                                                'Ekstra Hamle Engeli')) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      BonusIptaliWidget(
                                                                    iptalEdilenPuanBonusu: functions.eklenecekPuanHesaplama(
                                                                            columnSingleGameRecord!.taslakBoard1.toList(),
                                                                            functions.ekstraHamleEngeliDenkGelenler(columnSingleGameRecord!.indexlerBonuslari.toList(), FFAppState().newIndexes.toList()).toList(),
                                                                            functions.puanBolunmesiDenkGelenler(columnSingleGameRecord!.indexlerBonuslari.toList(), FFAppState().newIndexes.toList()).toList()) -
                                                                        functions.bonussuzEklenecekPuanHesaplama(columnSingleGameRecord!.taslakBoard1.toList(), functions.ekstraHamleEngeliDenkGelenler(columnSingleGameRecord!.indexlerBonuslari.toList(), FFAppState().newIndexes.toList()).toList()),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );

                                                          await columnSingleGameRecord!
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'player1Point': FieldValue.increment(-(functions.eklenecekPuanHesaplama(
                                                                        columnSingleGameRecord!
                                                                            .taslakBoard1
                                                                            .toList(),
                                                                        functions
                                                                            .ekstraHamleEngeliDenkGelenler(
                                                                                columnSingleGameRecord!.indexlerBonuslari
                                                                                    .toList(),
                                                                                FFAppState()
                                                                                    .newIndexes
                                                                                    .toList())
                                                                            .toList(),
                                                                        functions
                                                                            .puanBolunmesiDenkGelenler(
                                                                                columnSingleGameRecord!.indexlerBonuslari
                                                                                    .toList(),
                                                                                FFAppState()
                                                                                    .newIndexes
                                                                                    .toList())
                                                                            .toList()) -
                                                                    functions.bonussuzEklenecekPuanHesaplama(
                                                                        columnSingleGameRecord!
                                                                            .taslakBoard1
                                                                            .toList(),
                                                                        functions
                                                                            .ekstraHamleEngeliDenkGelenler(columnSingleGameRecord!.indexlerBonuslari.toList(),
                                                                                FFAppState().newIndexes.toList())
                                                                            .toList()))),
                                                              },
                                                            ),
                                                          });
                                                        }
                                                        if (FFAppState()
                                                            .turBonuslari
                                                            .contains(
                                                                'Kelime İptali')) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      KelimeIptaliWidget(),
                                                                ),
                                                              );
                                                            },
                                                          );

                                                          await columnSingleGameRecord!
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'player1Point': FieldValue.increment(-(functions.eklenecekPuanHesaplama(
                                                                    columnSingleGameRecord!
                                                                        .taslakBoard1
                                                                        .toList(),
                                                                    functions
                                                                        .kelimeIptaliDenkGelenler(
                                                                            columnSingleGameRecord!.indexlerBonuslari
                                                                                .toList(),
                                                                            FFAppState()
                                                                                .newIndexes
                                                                                .toList())
                                                                        .toList(),
                                                                    functions
                                                                        .puanBolunmesiDenkGelenler(
                                                                            columnSingleGameRecord!.indexlerBonuslari.toList(),
                                                                            FFAppState().newIndexes.toList())
                                                                        .toList()))),
                                                              },
                                                            ),
                                                          });
                                                        }
                                                        if (FFAppState()
                                                            .turBonuslari
                                                            .contains(
                                                                'Harf Yasağı')) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      KelimeIptaliWidget(),
                                                                ),
                                                              );
                                                            },
                                                          );

                                                          if (FFAppState()
                                                              .donduracakMi) {
                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update(
                                                                    createSingleGameRecordData(
                                                              player2blocked:
                                                                  true,
                                                            ));
                                                          } else {
                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update(
                                                                    createSingleGameRecordData(
                                                              player2blocked:
                                                                  false,
                                                            ));
                                                          }
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'geldik buraya',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );
                                                        }

                                                        if (FFAppState()
                                                            .turBonuslari
                                                            .contains(
                                                                'Bölge Yasağı')) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      BolgeYasagiWidget(),
                                                                ),
                                                              );
                                                            },
                                                          );

                                                          await columnSingleGameRecord!
                                                              .reference
                                                              .update(
                                                                  createSingleGameRecordData(
                                                            blockedSide:
                                                                FFAppState()
                                                                    .hangiBolgeBanlansin,
                                                          ));
                                                        }
                                                        if (FFAppState()
                                                            .turBonuslari
                                                            .contains(
                                                                'Ekstra Hamle Jokeri')) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      EkstraHarfJokeriWidget(),
                                                                ),
                                                              );
                                                            },
                                                          );

                                                          if (FFAppState()
                                                              .ekstraIsterMi) {
                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update(
                                                                    createSingleGameRecordData(
                                                              currentPlayerTurn:
                                                                  1,
                                                            ));
                                                          } else {
                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update(
                                                                    createSingleGameRecordData(
                                                              currentPlayerTurn:
                                                                  2,
                                                            ));
                                                          }
                                                        } else {
                                                          await columnSingleGameRecord!
                                                              .reference
                                                              .update(
                                                                  createSingleGameRecordData(
                                                            currentPlayerTurn:
                                                                2,
                                                          ));
                                                        }

                                                        if (columnSingleGameRecord!
                                                            .taslakLetters1
                                                            .isNotEmpty) {
                                                          await columnSingleGameRecord!
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'taslakBoard2':
                                                                    columnSingleGameRecord
                                                                        ?.boardLetters,
                                                                'taslakBoard1':
                                                                    columnSingleGameRecord
                                                                        ?.boardLetters,
                                                              },
                                                            ),
                                                          });
                                                          FFAppState()
                                                              .selectedLetter = '';
                                                          FFAppState()
                                                              .selectedPlayerIndex = 0;
                                                          FFAppState()
                                                                  .donduracakMi =
                                                              true;
                                                          FFAppState()
                                                                  .ekstraIsterMi =
                                                              true;
                                                          safeSetState(() {});
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        } else {
                                                          await columnSingleGameRecord!
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'player1Point':
                                                                    FieldValue.increment(
                                                                        valueOrDefault<
                                                                            int>(
                                                                  functions.oyuncu1HarfleriBitti(
                                                                      columnSingleGameRecord!
                                                                          .taslakLetters2
                                                                          .toList()),
                                                                  0,
                                                                )),
                                                                'player2Point':
                                                                    FieldValue.increment(
                                                                        -(valueOrDefault<
                                                                            int>(
                                                                  functions.oyuncu1HarfleriBitti(
                                                                      columnSingleGameRecord!
                                                                          .taslakLetters2
                                                                          .toList()),
                                                                  0,
                                                                ))),
                                                              },
                                                            ),
                                                          });
                                                          await Future.delayed(
                                                              const Duration(
                                                                  milliseconds:
                                                                      1000));

                                                          await columnSingleGameRecord!
                                                              .reference
                                                              .update(
                                                                  createSingleGameRecordData(
                                                            gameStatus: () {
                                                              if (columnSingleGameRecord!
                                                                      .player1Point >
                                                                  columnSingleGameRecord!
                                                                      .player2Point) {
                                                                return 1;
                                                              } else if (columnSingleGameRecord
                                                                      ?.player1Point ==
                                                                  columnSingleGameRecord
                                                                      ?.player2Point) {
                                                                return 3;
                                                              } else {
                                                                return 2;
                                                              }
                                                            }(),
                                                          ));
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        }
                                                      } else {
                                                        if (columnSingleGameRecord!
                                                            .taslakLetters1
                                                            .isNotEmpty) {
                                                          await columnSingleGameRecord!
                                                              .reference
                                                              .update(
                                                                  createSingleGameRecordData(
                                                            currentPlayerTurn:
                                                                2,
                                                          ));

                                                          await columnSingleGameRecord!
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'taslakBoard2':
                                                                    columnSingleGameRecord
                                                                        ?.boardLetters,
                                                                'taslakBoard1':
                                                                    columnSingleGameRecord
                                                                        ?.boardLetters,
                                                              },
                                                            ),
                                                          });
                                                          FFAppState()
                                                              .selectedLetter = '';
                                                          FFAppState()
                                                              .selectedPlayerIndex = 0;
                                                          FFAppState()
                                                                  .donduracakMi =
                                                              true;
                                                          FFAppState()
                                                                  .ekstraIsterMi =
                                                              true;
                                                          safeSetState(() {});
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        } else {
                                                          await columnSingleGameRecord!
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'player1Point':
                                                                    FieldValue.increment(
                                                                        valueOrDefault<
                                                                            int>(
                                                                  functions.oyuncu1HarfleriBitti(
                                                                      columnSingleGameRecord!
                                                                          .taslakLetters2
                                                                          .toList()),
                                                                  0,
                                                                )),
                                                                'player2Point':
                                                                    FieldValue.increment(
                                                                        -(valueOrDefault<
                                                                            int>(
                                                                  functions.oyuncu1HarfleriBitti(
                                                                      columnSingleGameRecord!
                                                                          .taslakLetters2
                                                                          .toList()),
                                                                  0,
                                                                ))),
                                                              },
                                                            ),
                                                          });
                                                          await Future.delayed(
                                                              const Duration(
                                                                  milliseconds:
                                                                      1000));

                                                          await columnSingleGameRecord!
                                                              .reference
                                                              .update(
                                                                  createSingleGameRecordData(
                                                            gameStatus: () {
                                                              if (columnSingleGameRecord!
                                                                      .player1Point >
                                                                  columnSingleGameRecord!
                                                                      .player2Point) {
                                                                return 1;
                                                              } else if (columnSingleGameRecord
                                                                      ?.player1Point ==
                                                                  columnSingleGameRecord
                                                                      ?.player2Point) {
                                                                return 3;
                                                              } else {
                                                                return 2;
                                                              }
                                                            }(),
                                                          ));
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        }
                                                      }
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Hatalı Kelimeler : ${functions.arrayToString(functions.legitOlmayanKelimeler(FFAppState().yeniKelimeler.toList(), _model.jsonFile!).toList())}',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              Color(0xFF6D0000),
                                                        ),
                                                      );
                                                    }
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Eklediğiniz bazı harfler diğerlerinden bağımsız.',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            Color(0xFF6D0000),
                                                      ),
                                                    );
                                                  }
                                                } else {
                                                  FFAppState().yeniKelimeler = functions
                                                      .yeniKelimeleriKontrolEt(
                                                          columnSingleGameRecord!
                                                              .taslakBoard1
                                                              .toList(),
                                                          columnSingleGameRecord!
                                                              .boardLetters
                                                              .toList())
                                                      .toList()
                                                      .cast<String>();
                                                  safeSetState(() {});

                                                  await columnSingleGameRecord!
                                                      .reference
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'taslakBoard1':
                                                            columnSingleGameRecord
                                                                ?.boardLetters,
                                                        'taslakLetters1':
                                                            columnSingleGameRecord
                                                                ?.player1Letters,
                                                      },
                                                    ),
                                                  });
                                                }

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                              },
                                              child: Container(
                                                width: 100.0,
                                                height: 43.9,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF312100),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    'Oyna',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if ((currentUserUid ==
                                          columnSingleGameRecord?.player2ID) &&
                                      (columnSingleGameRecord
                                              ?.currentPlayerTurn ==
                                          2))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await columnSingleGameRecord!
                                              .reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'boardLetters':
                                                    columnSingleGameRecord
                                                        ?.taslakBoard2,
                                              },
                                            ),
                                          });
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await columnSingleGameRecord!
                                                    .reference
                                                    .update({
                                                  ...createSingleGameRecordData(
                                                    gameStatus: 1,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'taslakBoard2':
                                                          columnSingleGameRecord
                                                              ?.boardLetters,
                                                      'taslakLetters2':
                                                          columnSingleGameRecord
                                                              ?.player2Letters,
                                                    },
                                                  ),
                                                });
                                                FFAppState()
                                                        .buTurJokerKullanildi =
                                                    false;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: 50.0,
                                                height: 43.9,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF312100),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    'FF',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await columnSingleGameRecord!
                                                    .reference
                                                    .update({
                                                  ...createSingleGameRecordData(
                                                    currentPlayerTurn: 1,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'taslakBoard2':
                                                          columnSingleGameRecord
                                                              ?.boardLetters,
                                                      'taslakLetters2':
                                                          columnSingleGameRecord
                                                              ?.player2Letters,
                                                    },
                                                  ),
                                                });
                                                FFAppState()
                                                        .buTurJokerKullanildi =
                                                    false;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: 50.0,
                                                height: 43.9,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF312100),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    'Pas',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await columnSingleGameRecord!
                                                    .reference
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'taslakBoard2':
                                                          columnSingleGameRecord
                                                              ?.boardLetters,
                                                      'taslakLetters2':
                                                          columnSingleGameRecord
                                                              ?.player2Letters,
                                                    },
                                                  ),
                                                });
                                                FFAppState()
                                                        .buTurJokerKullanildi =
                                                    false;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: 130.0,
                                                height: 43.9,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF312100),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    'Tahtayı Sıfırla',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Builder(
                                              builder: (context) => InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  var _shouldSetState = false;
                                                  if (functions
                                                          .yeniKelimeleriKontrolEt(
                                                              columnSingleGameRecord!
                                                                  .taslakBoard2
                                                                  .toList(),
                                                              columnSingleGameRecord!
                                                                  .boardLetters
                                                                  .toList())
                                                          .firstOrNull !=
                                                      'wrongplacement') {
                                                    if (functions.butunYeniIndexlerBagliMi(
                                                        columnSingleGameRecord!
                                                            .taslakBoard2
                                                            .toList(),
                                                        functions
                                                            .yeniHarfleriTespit(
                                                                columnSingleGameRecord!
                                                                    .taslakBoard2
                                                                    .toList(),
                                                                columnSingleGameRecord!
                                                                    .boardLetters
                                                                    .toList())
                                                            .toList())) {
                                                      FFAppState().yeniKelimeler = functions
                                                          .yeniKelimeleriKontrolEt(
                                                              columnSingleGameRecord!
                                                                  .taslakBoard2
                                                                  .toList(),
                                                              columnSingleGameRecord!
                                                                  .boardLetters
                                                                  .toList())
                                                          .toList()
                                                          .cast<String>();
                                                      safeSetState(() {});

                                                      await columnSingleGameRecord!
                                                          .reference
                                                          .update(
                                                              createSingleGameRecordData(
                                                        player2blocked: false,
                                                        blockedSide: 0,
                                                      ));
                                                      if (FFAppState()
                                                          .testModu) {
                                                        FFAppState().yeniKelimeler = functions
                                                            .yeniKelimeleriKontrolEt(
                                                                columnSingleGameRecord!
                                                                    .taslakBoard2
                                                                    .toList(),
                                                                columnSingleGameRecord!
                                                                    .boardLetters
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        FFAppState().eklenecekHarfler = functions
                                                            .yeniHarflerinListesiniVer(
                                                                columnSingleGameRecord!
                                                                    .usedLetters
                                                                    .toList(),
                                                                functions
                                                                    .kullanilanHarflerSilindi(
                                                                        columnSingleGameRecord!
                                                                            .boardLetters
                                                                            .toList(),
                                                                        columnSingleGameRecord!
                                                                            .taslakBoard2
                                                                            .toList(),
                                                                        columnSingleGameRecord!
                                                                            .player2Letters
                                                                            .toList())
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        FFAppState().newIndexes = functions
                                                            .yeniHarfleriTespit(
                                                                columnSingleGameRecord!
                                                                    .taslakBoard2
                                                                    .toList(),
                                                                columnSingleGameRecord!
                                                                    .boardLetters
                                                                    .toList())
                                                            .toList()
                                                            .cast<int>();
                                                        safeSetState(() {});
                                                        FFAppState().turBonuslari = functions
                                                            .didPlayerGetBonus(
                                                                columnSingleGameRecord!
                                                                    .indexlerBonuslari
                                                                    .toList(),
                                                                FFAppState()
                                                                    .newIndexes
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});

                                                        await columnSingleGameRecord!
                                                            .reference
                                                            .update({
                                                          ...createSingleGameRecordData(
                                                            lastMove:
                                                                getCurrentTimestamp
                                                                    .secondsSinceEpoch,
                                                            timeOut: functions.timeOutDegeriHesapla(
                                                                getCurrentTimestamp
                                                                    .millisecondsSinceEpoch,
                                                                columnSingleGameRecord!
                                                                    .gameTime),
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'player2Letters': functions.mergeStringList(
                                                                  functions
                                                                      .kullanilanHarflerSilindi(
                                                                          columnSingleGameRecord!
                                                                              .boardLetters
                                                                              .toList(),
                                                                          columnSingleGameRecord!
                                                                              .taslakBoard2
                                                                              .toList(),
                                                                          columnSingleGameRecord!
                                                                              .player2Letters
                                                                              .toList())
                                                                      .toList(),
                                                                  FFAppState()
                                                                      .eklenecekHarfler
                                                                      .toList()),
                                                              'usedLetters': functions.mergeStringList(
                                                                  columnSingleGameRecord!
                                                                      .usedLetters
                                                                      .toList(),
                                                                  FFAppState()
                                                                      .eklenecekHarfler
                                                                      .toList()),
                                                              'taslakLetters2': functions.mergeStringList(
                                                                  functions
                                                                      .kullanilanHarflerSilindi(
                                                                          columnSingleGameRecord!
                                                                              .boardLetters
                                                                              .toList(),
                                                                          columnSingleGameRecord!
                                                                              .taslakBoard2
                                                                              .toList(),
                                                                          columnSingleGameRecord!
                                                                              .player2Letters
                                                                              .toList())
                                                                      .toList(),
                                                                  FFAppState()
                                                                      .eklenecekHarfler
                                                                      .toList()),
                                                            },
                                                          ),
                                                        });

                                                        await columnSingleGameRecord!
                                                            .reference
                                                            .update(
                                                                createSingleGameRecordData(
                                                          timeOut: functions
                                                              .timeOutDegeriHesapla(
                                                                  getCurrentTimestamp
                                                                      .millisecondsSinceEpoch,
                                                                  columnSingleGameRecord!
                                                                      .gameTime),
                                                        ));

                                                        await columnSingleGameRecord!
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'boardLetters':
                                                                  columnSingleGameRecord
                                                                      ?.taslakBoard2,
                                                            },
                                                          ),
                                                        });

                                                        await columnSingleGameRecord!
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'player2Point': FieldValue.increment(functions.eklenecekPuanHesaplama(
                                                                  columnSingleGameRecord!
                                                                      .taslakBoard2
                                                                      .toList(),
                                                                  FFAppState()
                                                                      .newIndexes
                                                                      .toList(),
                                                                  functions
                                                                      .puanBolunmesiDenkGelenler(
                                                                          columnSingleGameRecord!
                                                                              .indexlerBonuslari
                                                                              .toList(),
                                                                          FFAppState()
                                                                              .newIndexes
                                                                              .toList())
                                                                      .toList())),
                                                            },
                                                          ),
                                                        });
                                                        if (FFAppState()
                                                            .turBonuslari
                                                            .isNotEmpty) {
                                                          if (FFAppState()
                                                              .turBonuslari
                                                              .contains(
                                                                  'Puan Transferi')) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        PuanTransferiWidget(
                                                                      aktarilanPuan: functions.eklenecekPuanHesaplama(
                                                                          columnSingleGameRecord!
                                                                              .taslakBoard2
                                                                              .toList(),
                                                                          functions
                                                                              .puanTransferiDenkGelenler(columnSingleGameRecord!.indexlerBonuslari.toList(), FFAppState().newIndexes.toList())
                                                                              .toList(),
                                                                          functions.puanBolunmesiDenkGelenler(columnSingleGameRecord!.indexlerBonuslari.toList(), FFAppState().newIndexes.toList()).toList()),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'player1Point': FieldValue.increment(functions.eklenecekPuanHesaplama(
                                                                      columnSingleGameRecord!
                                                                          .taslakBoard2
                                                                          .toList(),
                                                                      functions
                                                                          .puanTransferiDenkGelenler(
                                                                              columnSingleGameRecord!.indexlerBonuslari
                                                                                  .toList(),
                                                                              FFAppState()
                                                                                  .newIndexes
                                                                                  .toList())
                                                                          .toList(),
                                                                      functions
                                                                          .puanBolunmesiDenkGelenler(
                                                                              columnSingleGameRecord!.indexlerBonuslari.toList(),
                                                                              FFAppState().newIndexes.toList())
                                                                          .toList())),
                                                                  'player2Point': FieldValue.increment(-(functions.eklenecekPuanHesaplama(
                                                                      columnSingleGameRecord!
                                                                          .taslakBoard2
                                                                          .toList(),
                                                                      functions
                                                                          .puanTransferiDenkGelenler(
                                                                              columnSingleGameRecord!.indexlerBonuslari
                                                                                  .toList(),
                                                                              FFAppState()
                                                                                  .newIndexes
                                                                                  .toList())
                                                                          .toList(),
                                                                      functions
                                                                          .puanBolunmesiDenkGelenler(
                                                                              columnSingleGameRecord!.indexlerBonuslari.toList(),
                                                                              FFAppState().newIndexes.toList())
                                                                          .toList()))),
                                                                },
                                                              ),
                                                            });
                                                          }
                                                          if (FFAppState()
                                                              .turBonuslari
                                                              .contains(
                                                                  'Harf Kaybı')) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        HarfKaybiWidget(),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            FFAppState().harfKaybiYeniHarfler = functions
                                                                .yeniHarflerinListesiniVer(
                                                                    columnSingleGameRecord!
                                                                        .usedLetters
                                                                        .toList(),
                                                                    functions
                                                                        .setEmptyStringList()
                                                                        .toList())
                                                                .toList()
                                                                .cast<String>();
                                                            safeSetState(() {});

                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'player2Letters':
                                                                      FFAppState()
                                                                          .harfKaybiYeniHarfler,
                                                                  'taslakLetters2':
                                                                      FFAppState()
                                                                          .harfKaybiYeniHarfler,
                                                                  'usedLetters': functions.mergeStringList(
                                                                      columnSingleGameRecord!
                                                                          .usedLetters
                                                                          .toList(),
                                                                      FFAppState()
                                                                          .harfKaybiYeniHarfler
                                                                          .toList()),
                                                                },
                                                              ),
                                                            });
                                                          }
                                                          if (FFAppState()
                                                              .turBonuslari
                                                              .contains(
                                                                  'Ekstra Hamle Engeli')) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        BonusIptaliWidget(
                                                                      iptalEdilenPuanBonusu: functions.eklenecekPuanHesaplama(
                                                                              columnSingleGameRecord!.taslakBoard2.toList(),
                                                                              functions.ekstraHamleEngeliDenkGelenler(columnSingleGameRecord!.indexlerBonuslari.toList(), FFAppState().newIndexes.toList()).toList(),
                                                                              functions.puanBolunmesiDenkGelenler(columnSingleGameRecord!.indexlerBonuslari.toList(), FFAppState().newIndexes.toList()).toList()) -
                                                                          functions.bonussuzEklenecekPuanHesaplama(columnSingleGameRecord!.taslakBoard2.toList(), functions.ekstraHamleEngeliDenkGelenler(columnSingleGameRecord!.indexlerBonuslari.toList(), FFAppState().newIndexes.toList()).toList()),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'player2Point': FieldValue.increment(-(functions.eklenecekPuanHesaplama(
                                                                          columnSingleGameRecord!
                                                                              .taslakBoard1
                                                                              .toList(),
                                                                          functions
                                                                              .ekstraHamleEngeliDenkGelenler(columnSingleGameRecord!.indexlerBonuslari.toList(), FFAppState().newIndexes.toList())
                                                                              .toList(),
                                                                          functions.puanBolunmesiDenkGelenler(columnSingleGameRecord!.indexlerBonuslari.toList(), FFAppState().newIndexes.toList()).toList()) -
                                                                      functions.bonussuzEklenecekPuanHesaplama(columnSingleGameRecord!.taslakBoard1.toList(), functions.ekstraHamleEngeliDenkGelenler(columnSingleGameRecord!.indexlerBonuslari.toList(), FFAppState().newIndexes.toList()).toList()))),
                                                                },
                                                              ),
                                                            });
                                                          }
                                                          if (FFAppState()
                                                              .turBonuslari
                                                              .contains(
                                                                  'Kelime İptali')) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        KelimeIptaliWidget(),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'player2Point': FieldValue.increment(-(functions.eklenecekPuanHesaplama(
                                                                      columnSingleGameRecord!
                                                                          .taslakBoard2
                                                                          .toList(),
                                                                      functions
                                                                          .kelimeIptaliDenkGelenler(
                                                                              columnSingleGameRecord!.indexlerBonuslari
                                                                                  .toList(),
                                                                              FFAppState()
                                                                                  .newIndexes
                                                                                  .toList())
                                                                          .toList(),
                                                                      functions
                                                                          .puanBolunmesiDenkGelenler(
                                                                              columnSingleGameRecord!.indexlerBonuslari.toList(),
                                                                              FFAppState().newIndexes.toList())
                                                                          .toList()))),
                                                                },
                                                              ),
                                                            });
                                                          }
                                                          if (FFAppState()
                                                              .turBonuslari
                                                              .contains(
                                                                  'Harf Yasağı')) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        HarfYasagiWidget(),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            if (FFAppState()
                                                                .donduracakMi) {
                                                              await columnSingleGameRecord!
                                                                  .reference
                                                                  .update(
                                                                      createSingleGameRecordData(
                                                                player1blocked:
                                                                    true,
                                                              ));
                                                            } else {
                                                              await columnSingleGameRecord!
                                                                  .reference
                                                                  .update(
                                                                      createSingleGameRecordData(
                                                                player1blocked:
                                                                    false,
                                                              ));
                                                            }
                                                          }
                                                          if (FFAppState()
                                                              .turBonuslari
                                                              .contains(
                                                                  'Bölge Yasağı')) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        BolgeYasagiWidget(),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update(
                                                                    createSingleGameRecordData(
                                                              blockedSide:
                                                                  FFAppState()
                                                                      .hangiBolgeBanlansin,
                                                            ));
                                                          }
                                                          if (FFAppState()
                                                              .turBonuslari
                                                              .contains(
                                                                  'Ekstra Hamle Jokeri')) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        EkstraHarfJokeriWidget(),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            if (FFAppState()
                                                                .ekstraIsterMi) {
                                                              await columnSingleGameRecord!
                                                                  .reference
                                                                  .update(
                                                                      createSingleGameRecordData(
                                                                currentPlayerTurn:
                                                                    2,
                                                              ));
                                                            } else {
                                                              await columnSingleGameRecord!
                                                                  .reference
                                                                  .update(
                                                                      createSingleGameRecordData(
                                                                currentPlayerTurn:
                                                                    1,
                                                              ));
                                                            }
                                                          } else {
                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update(
                                                                    createSingleGameRecordData(
                                                              currentPlayerTurn:
                                                                  1,
                                                            ));
                                                          }

                                                          if (columnSingleGameRecord!
                                                              .taslakLetters2
                                                              .isNotEmpty) {
                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'taslakBoard2':
                                                                      columnSingleGameRecord
                                                                          ?.boardLetters,
                                                                  'taslakBoard1':
                                                                      columnSingleGameRecord
                                                                          ?.boardLetters,
                                                                },
                                                              ),
                                                            });
                                                            FFAppState()
                                                                .selectedLetter = '';
                                                            FFAppState()
                                                                .selectedPlayerIndex = 0;
                                                            FFAppState()
                                                                    .donduracakMi =
                                                                true;
                                                            FFAppState()
                                                                    .ekstraIsterMi =
                                                                true;
                                                            safeSetState(() {});
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          } else {
                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'player1Point':
                                                                      FieldValue
                                                                          .increment(
                                                                              -(valueOrDefault<int>(
                                                                    functions.oyuncu1HarfleriBitti(columnSingleGameRecord!
                                                                        .taslakLetters1
                                                                        .toList()),
                                                                    0,
                                                                  ))),
                                                                  'player2Point':
                                                                      FieldValue
                                                                          .increment(
                                                                              valueOrDefault<int>(
                                                                    functions.oyuncu1HarfleriBitti(columnSingleGameRecord!
                                                                        .taslakLetters1
                                                                        .toList()),
                                                                    0,
                                                                  )),
                                                                },
                                                              ),
                                                            });
                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        1000));

                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update(
                                                                    createSingleGameRecordData(
                                                              gameStatus: () {
                                                                if (columnSingleGameRecord!
                                                                        .player1Point >
                                                                    columnSingleGameRecord!
                                                                        .player2Point) {
                                                                  return 1;
                                                                } else if (columnSingleGameRecord
                                                                        ?.player1Point ==
                                                                    columnSingleGameRecord
                                                                        ?.player2Point) {
                                                                  return 3;
                                                                } else {
                                                                  return 2;
                                                                }
                                                              }(),
                                                            ));
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          }
                                                        } else {
                                                          if (columnSingleGameRecord!
                                                              .taslakLetters2
                                                              .isNotEmpty) {
                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update(
                                                                    createSingleGameRecordData(
                                                              currentPlayerTurn:
                                                                  1,
                                                            ));

                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'taslakBoard2':
                                                                      columnSingleGameRecord
                                                                          ?.boardLetters,
                                                                  'taslakBoard1':
                                                                      columnSingleGameRecord
                                                                          ?.boardLetters,
                                                                },
                                                              ),
                                                            });
                                                            FFAppState()
                                                                .selectedLetter = '';
                                                            FFAppState()
                                                                .selectedPlayerIndex = 0;
                                                            FFAppState()
                                                                    .donduracakMi =
                                                                true;
                                                            FFAppState()
                                                                    .ekstraIsterMi =
                                                                true;
                                                            safeSetState(() {});
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          } else {
                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'player1Point':
                                                                      FieldValue
                                                                          .increment(
                                                                              -(valueOrDefault<int>(
                                                                    functions.oyuncu1HarfleriBitti(columnSingleGameRecord!
                                                                        .taslakLetters1
                                                                        .toList()),
                                                                    0,
                                                                  ))),
                                                                  'player2Point':
                                                                      FieldValue
                                                                          .increment(
                                                                              valueOrDefault<int>(
                                                                    functions.oyuncu1HarfleriBitti(columnSingleGameRecord!
                                                                        .taslakLetters1
                                                                        .toList()),
                                                                    0,
                                                                  )),
                                                                },
                                                              ),
                                                            });
                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        1000));

                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update(
                                                                    createSingleGameRecordData(
                                                              gameStatus: () {
                                                                if (columnSingleGameRecord!
                                                                        .player1Point >
                                                                    columnSingleGameRecord!
                                                                        .player2Point) {
                                                                  return 1;
                                                                } else if (columnSingleGameRecord
                                                                        ?.player1Point ==
                                                                    columnSingleGameRecord
                                                                        ?.player2Point) {
                                                                  return 3;
                                                                } else {
                                                                  return 2;
                                                                }
                                                              }(),
                                                            ));
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          }
                                                        }
                                                      } else {
                                                        _model.player2JsonFile =
                                                            await actions
                                                                .initializeJSON(
                                                          'kelimeler',
                                                        );
                                                        _shouldSetState = true;
                                                      }

                                                      if (!(functions
                                                          .legitOlmayanKelimeler(
                                                              FFAppState()
                                                                  .yeniKelimeler
                                                                  .toList(),
                                                              _model
                                                                  .player2JsonFile!)
                                                          .isNotEmpty)) {
                                                        FFAppState().yeniKelimeler = functions
                                                            .yeniKelimeleriKontrolEt(
                                                                columnSingleGameRecord!
                                                                    .taslakBoard2
                                                                    .toList(),
                                                                columnSingleGameRecord!
                                                                    .boardLetters
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        FFAppState().eklenecekHarfler = functions
                                                            .yeniHarflerinListesiniVer(
                                                                columnSingleGameRecord!
                                                                    .usedLetters
                                                                    .toList(),
                                                                functions
                                                                    .kullanilanHarflerSilindi(
                                                                        columnSingleGameRecord!
                                                                            .boardLetters
                                                                            .toList(),
                                                                        columnSingleGameRecord!
                                                                            .taslakBoard2
                                                                            .toList(),
                                                                        columnSingleGameRecord!
                                                                            .player2Letters
                                                                            .toList())
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        FFAppState().newIndexes = functions
                                                            .yeniHarfleriTespit(
                                                                columnSingleGameRecord!
                                                                    .taslakBoard2
                                                                    .toList(),
                                                                columnSingleGameRecord!
                                                                    .boardLetters
                                                                    .toList())
                                                            .toList()
                                                            .cast<int>();
                                                        safeSetState(() {});
                                                        FFAppState().turBonuslari = functions
                                                            .didPlayerGetBonus(
                                                                columnSingleGameRecord!
                                                                    .indexlerBonuslari
                                                                    .toList(),
                                                                FFAppState()
                                                                    .newIndexes
                                                                    .toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});

                                                        await columnSingleGameRecord!
                                                            .reference
                                                            .update({
                                                          ...createSingleGameRecordData(
                                                            lastMove:
                                                                getCurrentTimestamp
                                                                    .secondsSinceEpoch,
                                                            timeOut: functions.timeOutDegeriHesapla(
                                                                getCurrentTimestamp
                                                                    .millisecondsSinceEpoch,
                                                                columnSingleGameRecord!
                                                                    .gameTime),
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'player2Letters': functions.mergeStringList(
                                                                  functions
                                                                      .kullanilanHarflerSilindi(
                                                                          columnSingleGameRecord!
                                                                              .boardLetters
                                                                              .toList(),
                                                                          columnSingleGameRecord!
                                                                              .taslakBoard2
                                                                              .toList(),
                                                                          columnSingleGameRecord!
                                                                              .player2Letters
                                                                              .toList())
                                                                      .toList(),
                                                                  FFAppState()
                                                                      .eklenecekHarfler
                                                                      .toList()),
                                                              'usedLetters': functions.mergeStringList(
                                                                  columnSingleGameRecord!
                                                                      .usedLetters
                                                                      .toList(),
                                                                  FFAppState()
                                                                      .eklenecekHarfler
                                                                      .toList()),
                                                              'taslakLetters2': functions.mergeStringList(
                                                                  functions
                                                                      .kullanilanHarflerSilindi(
                                                                          columnSingleGameRecord!
                                                                              .boardLetters
                                                                              .toList(),
                                                                          columnSingleGameRecord!
                                                                              .taslakBoard2
                                                                              .toList(),
                                                                          columnSingleGameRecord!
                                                                              .player2Letters
                                                                              .toList())
                                                                      .toList(),
                                                                  FFAppState()
                                                                      .eklenecekHarfler
                                                                      .toList()),
                                                            },
                                                          ),
                                                        });

                                                        await columnSingleGameRecord!
                                                            .reference
                                                            .update(
                                                                createSingleGameRecordData(
                                                          timeOut: functions
                                                              .timeOutDegeriHesapla(
                                                                  getCurrentTimestamp
                                                                      .millisecondsSinceEpoch,
                                                                  columnSingleGameRecord!
                                                                      .gameTime),
                                                        ));

                                                        await columnSingleGameRecord!
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'boardLetters':
                                                                  columnSingleGameRecord
                                                                      ?.taslakBoard2,
                                                            },
                                                          ),
                                                        });

                                                        await columnSingleGameRecord!
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'player2Point': FieldValue.increment(functions.eklenecekPuanHesaplama(
                                                                  columnSingleGameRecord!
                                                                      .taslakBoard2
                                                                      .toList(),
                                                                  FFAppState()
                                                                      .newIndexes
                                                                      .toList(),
                                                                  functions
                                                                      .puanBolunmesiDenkGelenler(
                                                                          columnSingleGameRecord!
                                                                              .indexlerBonuslari
                                                                              .toList(),
                                                                          FFAppState()
                                                                              .newIndexes
                                                                              .toList())
                                                                      .toList())),
                                                            },
                                                          ),
                                                        });
                                                        if (FFAppState()
                                                            .turBonuslari
                                                            .isNotEmpty) {
                                                          if (FFAppState()
                                                              .turBonuslari
                                                              .contains(
                                                                  'Puan Transferi')) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        PuanTransferiWidget(
                                                                      aktarilanPuan: functions.eklenecekPuanHesaplama(
                                                                          columnSingleGameRecord!
                                                                              .taslakBoard2
                                                                              .toList(),
                                                                          functions
                                                                              .puanTransferiDenkGelenler(columnSingleGameRecord!.indexlerBonuslari.toList(), FFAppState().newIndexes.toList())
                                                                              .toList(),
                                                                          functions.puanBolunmesiDenkGelenler(columnSingleGameRecord!.indexlerBonuslari.toList(), FFAppState().newIndexes.toList()).toList()),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'player1Point': FieldValue.increment(functions.eklenecekPuanHesaplama(
                                                                      columnSingleGameRecord!
                                                                          .taslakBoard2
                                                                          .toList(),
                                                                      functions
                                                                          .puanTransferiDenkGelenler(
                                                                              columnSingleGameRecord!.indexlerBonuslari
                                                                                  .toList(),
                                                                              FFAppState()
                                                                                  .newIndexes
                                                                                  .toList())
                                                                          .toList(),
                                                                      functions
                                                                          .puanBolunmesiDenkGelenler(
                                                                              columnSingleGameRecord!.indexlerBonuslari.toList(),
                                                                              FFAppState().newIndexes.toList())
                                                                          .toList())),
                                                                  'player2Point': FieldValue.increment(-(functions.eklenecekPuanHesaplama(
                                                                      columnSingleGameRecord!
                                                                          .taslakBoard2
                                                                          .toList(),
                                                                      functions
                                                                          .puanTransferiDenkGelenler(
                                                                              columnSingleGameRecord!.indexlerBonuslari
                                                                                  .toList(),
                                                                              FFAppState()
                                                                                  .newIndexes
                                                                                  .toList())
                                                                          .toList(),
                                                                      functions
                                                                          .puanBolunmesiDenkGelenler(
                                                                              columnSingleGameRecord!.indexlerBonuslari.toList(),
                                                                              FFAppState().newIndexes.toList())
                                                                          .toList()))),
                                                                },
                                                              ),
                                                            });
                                                          }
                                                          if (FFAppState()
                                                              .turBonuslari
                                                              .contains(
                                                                  'Harf Kaybı')) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        HarfKaybiWidget(),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            FFAppState().harfKaybiYeniHarfler = functions
                                                                .yeniHarflerinListesiniVer(
                                                                    columnSingleGameRecord!
                                                                        .usedLetters
                                                                        .toList(),
                                                                    functions
                                                                        .setEmptyStringList()
                                                                        .toList())
                                                                .toList()
                                                                .cast<String>();
                                                            safeSetState(() {});

                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'player2Letters':
                                                                      FFAppState()
                                                                          .harfKaybiYeniHarfler,
                                                                  'taslakLetters2':
                                                                      FFAppState()
                                                                          .harfKaybiYeniHarfler,
                                                                  'usedLetters': functions.mergeStringList(
                                                                      columnSingleGameRecord!
                                                                          .usedLetters
                                                                          .toList(),
                                                                      FFAppState()
                                                                          .harfKaybiYeniHarfler
                                                                          .toList()),
                                                                },
                                                              ),
                                                            });
                                                          }
                                                          if (FFAppState()
                                                              .turBonuslari
                                                              .contains(
                                                                  'Ekstra Hamle Engeli')) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        BonusIptaliWidget(
                                                                      iptalEdilenPuanBonusu: functions.eklenecekPuanHesaplama(
                                                                              columnSingleGameRecord!.taslakBoard2.toList(),
                                                                              functions.ekstraHamleEngeliDenkGelenler(columnSingleGameRecord!.indexlerBonuslari.toList(), FFAppState().newIndexes.toList()).toList(),
                                                                              functions.puanBolunmesiDenkGelenler(columnSingleGameRecord!.indexlerBonuslari.toList(), FFAppState().newIndexes.toList()).toList()) -
                                                                          functions.bonussuzEklenecekPuanHesaplama(columnSingleGameRecord!.taslakBoard2.toList(), functions.ekstraHamleEngeliDenkGelenler(columnSingleGameRecord!.indexlerBonuslari.toList(), FFAppState().newIndexes.toList()).toList()),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'player2Point': FieldValue.increment(-(functions.eklenecekPuanHesaplama(
                                                                          columnSingleGameRecord!
                                                                              .taslakBoard1
                                                                              .toList(),
                                                                          functions
                                                                              .ekstraHamleEngeliDenkGelenler(columnSingleGameRecord!.indexlerBonuslari.toList(), FFAppState().newIndexes.toList())
                                                                              .toList(),
                                                                          functions.puanBolunmesiDenkGelenler(columnSingleGameRecord!.indexlerBonuslari.toList(), FFAppState().newIndexes.toList()).toList()) -
                                                                      functions.bonussuzEklenecekPuanHesaplama(columnSingleGameRecord!.taslakBoard1.toList(), functions.ekstraHamleEngeliDenkGelenler(columnSingleGameRecord!.indexlerBonuslari.toList(), FFAppState().newIndexes.toList()).toList()))),
                                                                },
                                                              ),
                                                            });
                                                          }
                                                          if (FFAppState()
                                                              .turBonuslari
                                                              .contains(
                                                                  'Kelime İptali')) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        KelimeIptaliWidget(),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'player2Point': FieldValue.increment(-(functions.eklenecekPuanHesaplama(
                                                                      columnSingleGameRecord!
                                                                          .taslakBoard2
                                                                          .toList(),
                                                                      functions
                                                                          .kelimeIptaliDenkGelenler(
                                                                              columnSingleGameRecord!.indexlerBonuslari
                                                                                  .toList(),
                                                                              FFAppState()
                                                                                  .newIndexes
                                                                                  .toList())
                                                                          .toList(),
                                                                      functions
                                                                          .puanBolunmesiDenkGelenler(
                                                                              columnSingleGameRecord!.indexlerBonuslari.toList(),
                                                                              FFAppState().newIndexes.toList())
                                                                          .toList()))),
                                                                },
                                                              ),
                                                            });
                                                          }
                                                          if (FFAppState()
                                                              .turBonuslari
                                                              .contains(
                                                                  'Harf Yasağı')) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        KelimeIptaliWidget(),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            if (FFAppState()
                                                                .donduracakMi) {
                                                              await columnSingleGameRecord!
                                                                  .reference
                                                                  .update(
                                                                      createSingleGameRecordData(
                                                                player1blocked:
                                                                    true,
                                                              ));
                                                            } else {
                                                              await columnSingleGameRecord!
                                                                  .reference
                                                                  .update(
                                                                      createSingleGameRecordData(
                                                                player1blocked:
                                                                    false,
                                                              ));
                                                            }
                                                          }
                                                          if (FFAppState()
                                                              .turBonuslari
                                                              .contains(
                                                                  'Bölge Yasağı')) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        BolgeYasagiWidget(),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update(
                                                                    createSingleGameRecordData(
                                                              blockedSide:
                                                                  FFAppState()
                                                                      .hangiBolgeBanlansin,
                                                            ));
                                                          }
                                                          if (FFAppState()
                                                              .turBonuslari
                                                              .contains(
                                                                  'Ekstra Hamle Jokeri')) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        EkstraHarfJokeriWidget(),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            if (FFAppState()
                                                                .ekstraIsterMi) {
                                                              await columnSingleGameRecord!
                                                                  .reference
                                                                  .update(
                                                                      createSingleGameRecordData(
                                                                currentPlayerTurn:
                                                                    2,
                                                              ));
                                                            } else {
                                                              await columnSingleGameRecord!
                                                                  .reference
                                                                  .update(
                                                                      createSingleGameRecordData(
                                                                currentPlayerTurn:
                                                                    1,
                                                              ));
                                                            }
                                                          } else {
                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update(
                                                                    createSingleGameRecordData(
                                                              currentPlayerTurn:
                                                                  1,
                                                            ));
                                                          }

                                                          if (columnSingleGameRecord!
                                                              .taslakLetters2
                                                              .isNotEmpty) {
                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'taslakBoard2':
                                                                      columnSingleGameRecord
                                                                          ?.boardLetters,
                                                                  'taslakBoard1':
                                                                      columnSingleGameRecord
                                                                          ?.boardLetters,
                                                                },
                                                              ),
                                                            });
                                                            FFAppState()
                                                                .selectedLetter = '';
                                                            FFAppState()
                                                                .selectedPlayerIndex = 0;
                                                            FFAppState()
                                                                    .donduracakMi =
                                                                true;
                                                            FFAppState()
                                                                    .ekstraIsterMi =
                                                                true;
                                                            safeSetState(() {});
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          } else {
                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'player1Point':
                                                                      FieldValue
                                                                          .increment(
                                                                              -(valueOrDefault<int>(
                                                                    functions.oyuncu1HarfleriBitti(columnSingleGameRecord!
                                                                        .taslakLetters1
                                                                        .toList()),
                                                                    0,
                                                                  ))),
                                                                  'player2Point':
                                                                      FieldValue
                                                                          .increment(
                                                                              valueOrDefault<int>(
                                                                    functions.oyuncu1HarfleriBitti(columnSingleGameRecord!
                                                                        .taslakLetters1
                                                                        .toList()),
                                                                    0,
                                                                  )),
                                                                },
                                                              ),
                                                            });
                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        1000));

                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update(
                                                                    createSingleGameRecordData(
                                                              gameStatus: () {
                                                                if (columnSingleGameRecord!
                                                                        .player1Point >
                                                                    columnSingleGameRecord!
                                                                        .player2Point) {
                                                                  return 1;
                                                                } else if (columnSingleGameRecord
                                                                        ?.player1Point ==
                                                                    columnSingleGameRecord
                                                                        ?.player2Point) {
                                                                  return 3;
                                                                } else {
                                                                  return 2;
                                                                }
                                                              }(),
                                                            ));
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          }
                                                        } else {
                                                          if (columnSingleGameRecord!
                                                              .taslakLetters2
                                                              .isNotEmpty) {
                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update(
                                                                    createSingleGameRecordData(
                                                              currentPlayerTurn:
                                                                  1,
                                                            ));

                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'taslakBoard2':
                                                                      columnSingleGameRecord
                                                                          ?.boardLetters,
                                                                  'taslakBoard1':
                                                                      columnSingleGameRecord
                                                                          ?.boardLetters,
                                                                },
                                                              ),
                                                            });
                                                            FFAppState()
                                                                .selectedLetter = '';
                                                            FFAppState()
                                                                .selectedPlayerIndex = 0;
                                                            FFAppState()
                                                                    .donduracakMi =
                                                                true;
                                                            FFAppState()
                                                                    .ekstraIsterMi =
                                                                true;
                                                            safeSetState(() {});
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          } else {
                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'player1Point':
                                                                      FieldValue
                                                                          .increment(
                                                                              -(valueOrDefault<int>(
                                                                    functions.oyuncu1HarfleriBitti(columnSingleGameRecord!
                                                                        .taslakLetters1
                                                                        .toList()),
                                                                    0,
                                                                  ))),
                                                                  'player2Point':
                                                                      FieldValue
                                                                          .increment(
                                                                              valueOrDefault<int>(
                                                                    functions.oyuncu1HarfleriBitti(columnSingleGameRecord!
                                                                        .taslakLetters1
                                                                        .toList()),
                                                                    0,
                                                                  )),
                                                                },
                                                              ),
                                                            });
                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        1000));

                                                            await columnSingleGameRecord!
                                                                .reference
                                                                .update(
                                                                    createSingleGameRecordData(
                                                              gameStatus: () {
                                                                if (columnSingleGameRecord!
                                                                        .player1Point >
                                                                    columnSingleGameRecord!
                                                                        .player2Point) {
                                                                  return 1;
                                                                } else if (columnSingleGameRecord
                                                                        ?.player1Point ==
                                                                    columnSingleGameRecord
                                                                        ?.player2Point) {
                                                                  return 3;
                                                                } else {
                                                                  return 2;
                                                                }
                                                              }(),
                                                            ));
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          }
                                                        }
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Hatalı Kelimeler : ${functions.arrayToString(functions.legitOlmayanKelimeler(FFAppState().yeniKelimeler.toList(), _model.player2JsonFile!).toList())}',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                Color(
                                                                    0xFF6D0000),
                                                          ),
                                                        );
                                                      }
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Eklediğiniz bazı harfler diğerlerinden bağımsız.',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              Color(0xFF6D0000),
                                                        ),
                                                      );
                                                    }
                                                  } else {
                                                    FFAppState().yeniKelimeler = functions
                                                        .yeniKelimeleriKontrolEt(
                                                            columnSingleGameRecord!
                                                                .taslakBoard2
                                                                .toList(),
                                                            columnSingleGameRecord!
                                                                .boardLetters
                                                                .toList())
                                                        .toList()
                                                        .cast<String>();
                                                    safeSetState(() {});

                                                    await columnSingleGameRecord!
                                                        .reference
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'taslakBoard2':
                                                              columnSingleGameRecord
                                                                  ?.boardLetters,
                                                          'taslakLetters2':
                                                              columnSingleGameRecord
                                                                  ?.player2Letters,
                                                        },
                                                      ),
                                                    });
                                                  }

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                },
                                                child: Container(
                                                  width: 100.0,
                                                  height: 43.9,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF312100),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      'Oyna',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Colors.white,
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            if (columnSingleGameRecord?.player2ID != 'empty')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 5.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 10.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFF4DF),
                                      borderRadius: BorderRadius.circular(14.0),
                                      border: Border.all(
                                        color: Color(0xFF312100),
                                        width: 3.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Kalan Harf : ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Container(
                                            width: 61.1,
                                            height: 30.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFFF4DF),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color: Color(0xFF312100),
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                (100 -
                                                        columnSingleGameRecord!
                                                            .usedLetters.length)
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Bonuslar : ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if ((columnSingleGameRecord?.player2ID !=
                                    'empty') &&
                                (currentUserUid ==
                                    columnSingleGameRecord?.player1ID))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 20.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 10.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFF4DF),
                                      borderRadius: BorderRadius.circular(14.0),
                                      border: Border.all(
                                        color: Color(0xFF312100),
                                        width: 3.0,
                                      ),
                                    ),
                                    child: Visibility(
                                      visible:
                                          (columnSingleGameRecord?.player2ID !=
                                                  'empty') &&
                                              (currentUserUid ==
                                                  columnSingleGameRecord
                                                      ?.player1ID),
                                      child:
                                          StreamBuilder<List<SingleGameRecord>>(
                                        stream: querySingleGameRecord(
                                          queryBuilder: (singleGameRecord) =>
                                              singleGameRecord.where(
                                            'gameID',
                                            isEqualTo: widget!.oyunID,
                                          ),
                                          singleRecord: true,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<SingleGameRecord>
                                              rowSingleGameRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final rowSingleGameRecord =
                                              rowSingleGameRecordList.isNotEmpty
                                                  ? rowSingleGameRecordList
                                                      .first
                                                  : null;

                                          return Builder(
                                            builder: (context) {
                                              final everyPlayerLetter =
                                                  rowSingleGameRecord
                                                          ?.taslakLetters1
                                                          ?.map((e) => e)
                                                          .toList()
                                                          ?.take(7)
                                                          .toList()
                                                          ?.toList() ??
                                                      [];

                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: List.generate(
                                                    everyPlayerLetter.length,
                                                    (everyPlayerLetterIndex) {
                                                  final everyPlayerLetterItem =
                                                      everyPlayerLetter[
                                                          everyPlayerLetterIndex];
                                                  return Builder(
                                                    builder: (context) =>
                                                        InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        if (rowSingleGameRecord!
                                                                .player1blocked &&
                                                            ((everyPlayerLetterIndex ==
                                                                    1) ||
                                                                (everyPlayerLetterIndex ==
                                                                    0))) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Bu karakter rakip tarafından donduruldu.',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      3000),
                                                              backgroundColor:
                                                                  Color(
                                                                      0xFF6D0000),
                                                            ),
                                                          );
                                                        } else {
                                                          FFAppState()
                                                                  .selectedLetter =
                                                              everyPlayerLetterItem;
                                                          FFAppState()
                                                                  .selectedPlayerIndex =
                                                              everyPlayerLetterIndex;
                                                          safeSetState(() {});
                                                          if (everyPlayerLetterItem ==
                                                              '?') {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        JokerSecWidget(),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            if (true) {
                                                              FFAppState()
                                                                      .selectedLetter =
                                                                  FFAppState()
                                                                      .jokerSecildi;
                                                              FFAppState()
                                                                      .buTurJokerKullanildi =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          } else {
                                                            FFAppState()
                                                                    .buTurJokerKullanildi =
                                                                false;
                                                            safeSetState(() {});
                                                          }
                                                        }
                                                      },
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 8.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        child: Container(
                                                          width: valueOrDefault<
                                                              double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                valueOrDefault<
                                                                    double>(
                                                                  everyPlayerLetterIndex ==
                                                                          FFAppState()
                                                                              .selectedPlayerIndex
                                                                      ? 0.13
                                                                      : 0.10,
                                                                  0.10,
                                                                ),
                                                            14.0,
                                                          ),
                                                          height:
                                                              valueOrDefault<
                                                                  double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                valueOrDefault<
                                                                    double>(
                                                                  everyPlayerLetterIndex ==
                                                                          FFAppState()
                                                                              .selectedPlayerIndex
                                                                      ? 0.15
                                                                      : 0.14,
                                                                  0.14,
                                                                ),
                                                            14.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              rowSingleGameRecord!
                                                                          .player1blocked &&
                                                                      ((everyPlayerLetterIndex ==
                                                                              1) ||
                                                                          (everyPlayerLetterIndex ==
                                                                              0))
                                                                  ? Color(
                                                                      0xFF006985)
                                                                  : Colors
                                                                      .black,
                                                              Colors.black,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFFA59C9C),
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            3.0,
                                                                            1.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          4.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        functions
                                                                            .getPointOfLetter(everyPlayerLetterItem)
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Colors.white,
                                                                              fontSize: 10.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              lineHeight: 1.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    everyPlayerLetterItem,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              28.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                          lineHeight:
                                                                              1.0,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }).divide(SizedBox(width: 5.0)),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if ((columnSingleGameRecord?.player2ID !=
                                    'empty') &&
                                (currentUserUid ==
                                    columnSingleGameRecord?.player2ID))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 20.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 10.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFF4DF),
                                      borderRadius: BorderRadius.circular(14.0),
                                      border: Border.all(
                                        color: Color(0xFF312100),
                                        width: 3.0,
                                      ),
                                    ),
                                    child:
                                        StreamBuilder<List<SingleGameRecord>>(
                                      stream: querySingleGameRecord(
                                        queryBuilder: (singleGameRecord) =>
                                            singleGameRecord.where(
                                          'gameID',
                                          isEqualTo: widget!.oyunID,
                                        ),
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<SingleGameRecord>
                                            rowSingleGameRecordList =
                                            snapshot.data!;
                                        // Return an empty Container when the item does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final rowSingleGameRecord =
                                            rowSingleGameRecordList.isNotEmpty
                                                ? rowSingleGameRecordList.first
                                                : null;

                                        return Builder(
                                          builder: (context) {
                                            final everyPlayerLetter2 =
                                                rowSingleGameRecord
                                                        ?.taslakLetters2
                                                        ?.map((e) => e)
                                                        .toList()
                                                        ?.take(7)
                                                        .toList()
                                                        ?.toList() ??
                                                    [];

                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: List.generate(
                                                  everyPlayerLetter2.length,
                                                  (everyPlayerLetter2Index) {
                                                final everyPlayerLetter2Item =
                                                    everyPlayerLetter2[
                                                        everyPlayerLetter2Index];
                                                return Builder(
                                                  builder: (context) => InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (columnSingleGameRecord!
                                                              .player2blocked &&
                                                          ((everyPlayerLetter2Index ==
                                                                  1) ||
                                                              (everyPlayerLetter2Index ==
                                                                  0))) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Bu karakter rakip tarafından donduruldu.',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    3000),
                                                            backgroundColor:
                                                                Color(
                                                                    0xFF6D0000),
                                                          ),
                                                        );
                                                      } else {
                                                        FFAppState()
                                                                .selectedLetter =
                                                            everyPlayerLetter2Item;
                                                        FFAppState()
                                                                .selectedPlayerIndex =
                                                            everyPlayerLetter2Index;
                                                        safeSetState(() {});
                                                        if (everyPlayerLetter2Item ==
                                                            '?') {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      JokerSecWidget(),
                                                                ),
                                                              );
                                                            },
                                                          );

                                                          if (true) {
                                                            FFAppState()
                                                                    .selectedLetter =
                                                                FFAppState()
                                                                    .jokerSecildi;
                                                            FFAppState()
                                                                    .buTurJokerKullanildi =
                                                                true;
                                                            safeSetState(() {});
                                                          }
                                                        } else {
                                                          FFAppState()
                                                                  .buTurJokerKullanildi =
                                                              false;
                                                          safeSetState(() {});
                                                        }
                                                      }
                                                    },
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 8.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Container(
                                                        width: valueOrDefault<
                                                            double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .width *
                                                              (everyPlayerLetter2Index ==
                                                                      FFAppState()
                                                                          .selectedPlayerIndex
                                                                  ? 0.13
                                                                  : 0.1),
                                                          10.0,
                                                        ),
                                                        height: valueOrDefault<
                                                            double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .width *
                                                              (everyPlayerLetter2Index ==
                                                                      FFAppState()
                                                                          .selectedPlayerIndex
                                                                  ? 0.15
                                                                  : 0.14),
                                                          10.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            columnSingleGameRecord!
                                                                        .player2blocked &&
                                                                    ((everyPlayerLetter2Index ==
                                                                            1) ||
                                                                        (everyPlayerLetter2Index ==
                                                                            0))
                                                                ? Color(
                                                                    0xFF006985)
                                                                : Colors.black,
                                                            Colors.black,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                          border: Border.all(
                                                            color: Color(
                                                                0xFFA59C9C),
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          3.0,
                                                                          1.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            4.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      functions
                                                                          .getPointOfLetter(
                                                                              everyPlayerLetter2Item)
                                                                          .toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                10.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            lineHeight:
                                                                                1.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  everyPlayerLetter2Item,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            28.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                        lineHeight:
                                                                            1.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }).divide(SizedBox(width: 5.0)),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            if (columnSingleGameRecord?.player2ID == 'empty')
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0,
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.3,
                                          0.0,
                                        ),
                                        0.0,
                                        0.0),
                                    child: Text(
                                      'Rakip Aranıyor',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Lottie.asset(
                                        'assets/jsons/Animation_-_1745827854166.json',
                                        width: 200.0,
                                        height: 200.0,
                                        fit: BoxFit.contain,
                                        animate: true,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
