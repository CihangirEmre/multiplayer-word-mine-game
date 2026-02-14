import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'oyun_baslat_model.dart';
export 'oyun_baslat_model.dart';

class OyunBaslatWidget extends StatefulWidget {
  const OyunBaslatWidget({super.key});

  static String routeName = 'oyunBaslat';
  static String routePath = '/oyunBaslat';

  @override
  State<OyunBaslatWidget> createState() => _OyunBaslatWidgetState();
}

class _OyunBaslatWidgetState extends State<OyunBaslatWidget> {
  late OyunBaslatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OyunBaslatModel());
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Oyun Başlatma Ekranı',
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
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
            ].divide(SizedBox(width: 10.0)),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Hızlı Oyun',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    Text(
                      'Genişletilmiş Oyun',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ],
                ),
              ),
              FlutterFlowChoiceChips(
                options: [
                  ChipData('2 Dakika'),
                  ChipData('5 Dakika'),
                  ChipData('12 Saat'),
                  ChipData('24 Saat')
                ],
                onChanged: (val) async {
                  safeSetState(
                      () => _model.choiceChipsValue = val?.firstOrNull);
                  FFAppState().selectedGameTime = () {
                    if (_model.choiceChipsValue == '2 Dakika') {
                      return 2;
                    } else if (_model.choiceChipsValue == '5 Dakika') {
                      return 5;
                    } else if (_model.choiceChipsValue == '12 Saat') {
                      return 12;
                    } else {
                      return 24;
                    }
                  }();
                  safeSetState(() {});
                },
                selectedChipStyle: ChipStyle(
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).info,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  iconColor: FlutterFlowTheme.of(context).info,
                  iconSize: 16.0,
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                unselectedChipStyle: ChipStyle(
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  iconColor: FlutterFlowTheme.of(context).secondaryText,
                  iconSize: 16.0,
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                chipSpacing: 8.0,
                rowSpacing: 8.0,
                multiselect: false,
                initialized: _model.choiceChipsValue != null,
                alignment: WrapAlignment.start,
                controller: _model.choiceChipsValueController ??=
                    FormFieldController<List<String>>(
                  ['2 Dakika'],
                ),
                wrapped: true,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: StreamBuilder<List<SingleGameRecord>>(
                  stream: querySingleGameRecord(
                    queryBuilder: (singleGameRecord) => singleGameRecord
                        .where(
                          'player2ID',
                          isEqualTo: 'empty',
                        )
                        .where(
                          'gameTime',
                          isEqualTo: FFAppState().selectedGameTime,
                        )
                        .orderBy('player1Name'),
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
                    List<SingleGameRecord> buttonSingleGameRecordList =
                        snapshot.data!;

                    return FFButtonWidget(
                      onPressed: () async {
                        _model.ciktiDosyasi = await querySingleGameRecordOnce(
                          queryBuilder: (singleGameRecord) => singleGameRecord
                              .where(
                                'player2ID',
                                isEqualTo: 'empty',
                              )
                              .where(
                                'gameTime',
                                isEqualTo: FFAppState().selectedGameTime,
                              ),
                        );
                        if (_model.ciktiDosyasi != null &&
                            (_model.ciktiDosyasi)!.isNotEmpty) {
                          await _model.ciktiDosyasi!.firstOrNull!.reference
                              .update(createSingleGameRecordData(
                            player2ID: currentUserUid,
                            player2Name: currentUserDisplayName,
                          ));

                          context.pushNamed(
                            GamePageWidget.routeName,
                            queryParameters: {
                              'oyunID': serializeParam(
                                buttonSingleGameRecordList
                                    .firstOrNull?.reference.id,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        } else {
                          FFAppState().creation14Letters = functions
                              .give14RandomLetters()
                              .toList()
                              .cast<String>();
                          safeSetState(() {});

                          var singleGameRecordReference =
                              SingleGameRecord.collection.doc();
                          await singleGameRecordReference.set({
                            ...createSingleGameRecordData(
                              player1Name: currentUserDisplayName,
                              player1ID: currentUserUid,
                              player2Name: 'empty',
                              player2ID: 'empty',
                              player1Point: 0,
                              player2Point: 0,
                              gameTime: FFAppState().selectedGameTime,
                              gameStatus: 0,
                              gameID: '0',
                              currentPlayerTurn: 1,
                              sonHamle: getCurrentTimestamp,
                              lastMove: getCurrentTimestamp.secondsSinceEpoch,
                              player1blocked: false,
                              player2blocked: false,
                              blockedSide: 0,
                            ),
                            ...mapToFirestore(
                              {
                                'player1Letters': functions.getFirst7Index(
                                    FFAppState().creation14Letters.toList()),
                                'player2Letters': functions.getLast7Index(
                                    FFAppState().creation14Letters.toList()),
                                'boardLetters': functions.setEmptyBoard(),
                                'taslakBoard1': functions.setEmptyBoard(),
                                'taslakBoard2': functions.setEmptyBoard(),
                                'usedLetters': FFAppState().creation14Letters,
                                'indexlerBonuslari':
                                    getIndexVeBonusListFirestoreData(
                                  functions.bonuslariIndexeYerlestir(),
                                ),
                                'taslakLetters1': functions.getFirst7Index(
                                    FFAppState().creation14Letters.toList()),
                                'taslakLetters2': functions.getLast7Index(
                                    FFAppState().creation14Letters.toList()),
                              },
                            ),
                          });
                          _model.documentCreation =
                              SingleGameRecord.getDocumentFromData({
                            ...createSingleGameRecordData(
                              player1Name: currentUserDisplayName,
                              player1ID: currentUserUid,
                              player2Name: 'empty',
                              player2ID: 'empty',
                              player1Point: 0,
                              player2Point: 0,
                              gameTime: FFAppState().selectedGameTime,
                              gameStatus: 0,
                              gameID: '0',
                              currentPlayerTurn: 1,
                              sonHamle: getCurrentTimestamp,
                              lastMove: getCurrentTimestamp.secondsSinceEpoch,
                              player1blocked: false,
                              player2blocked: false,
                              blockedSide: 0,
                            ),
                            ...mapToFirestore(
                              {
                                'player1Letters': functions.getFirst7Index(
                                    FFAppState().creation14Letters.toList()),
                                'player2Letters': functions.getLast7Index(
                                    FFAppState().creation14Letters.toList()),
                                'boardLetters': functions.setEmptyBoard(),
                                'taslakBoard1': functions.setEmptyBoard(),
                                'taslakBoard2': functions.setEmptyBoard(),
                                'usedLetters': FFAppState().creation14Letters,
                                'indexlerBonuslari':
                                    getIndexVeBonusListFirestoreData(
                                  functions.bonuslariIndexeYerlestir(),
                                ),
                                'taslakLetters1': functions.getFirst7Index(
                                    FFAppState().creation14Letters.toList()),
                                'taslakLetters2': functions.getLast7Index(
                                    FFAppState().creation14Letters.toList()),
                              },
                            ),
                          }, singleGameRecordReference);

                          await _model.documentCreation!.reference
                              .update(createSingleGameRecordData(
                            gameID: _model.documentCreation?.reference.id,
                            timeOut: functions.timeOutDegeriHesapla(
                                getCurrentTimestamp.millisecondsSinceEpoch, 24),
                          ));

                          context.pushNamed(
                            GamePageWidget.routeName,
                            queryParameters: {
                              'oyunID': serializeParam(
                                _model.documentCreation?.reference.id,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        }

                        safeSetState(() {});
                      },
                      text: 'Aramayı Başlat',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF431B00),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(AnaEkranWidget.routeName);
                  },
                  text: 'İptal',
                  options: FFButtonOptions(
                    width: 80.0,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF431B00),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
