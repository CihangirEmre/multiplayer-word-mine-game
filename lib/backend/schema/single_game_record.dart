import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SingleGameRecord extends FirestoreRecord {
  SingleGameRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "player1Name" field.
  String? _player1Name;
  String get player1Name => _player1Name ?? '';
  bool hasPlayer1Name() => _player1Name != null;

  // "player1ID" field.
  String? _player1ID;
  String get player1ID => _player1ID ?? '';
  bool hasPlayer1ID() => _player1ID != null;

  // "player2Name" field.
  String? _player2Name;
  String get player2Name => _player2Name ?? '';
  bool hasPlayer2Name() => _player2Name != null;

  // "player2ID" field.
  String? _player2ID;
  String get player2ID => _player2ID ?? '';
  bool hasPlayer2ID() => _player2ID != null;

  // "player1Letters" field.
  List<String>? _player1Letters;
  List<String> get player1Letters => _player1Letters ?? const [];
  bool hasPlayer1Letters() => _player1Letters != null;

  // "player2Letters" field.
  List<String>? _player2Letters;
  List<String> get player2Letters => _player2Letters ?? const [];
  bool hasPlayer2Letters() => _player2Letters != null;

  // "boardLetters" field.
  List<String>? _boardLetters;
  List<String> get boardLetters => _boardLetters ?? const [];
  bool hasBoardLetters() => _boardLetters != null;

  // "player1Point" field.
  int? _player1Point;
  int get player1Point => _player1Point ?? 0;
  bool hasPlayer1Point() => _player1Point != null;

  // "player2Point" field.
  int? _player2Point;
  int get player2Point => _player2Point ?? 0;
  bool hasPlayer2Point() => _player2Point != null;

  // "gameTime" field.
  int? _gameTime;
  int get gameTime => _gameTime ?? 0;
  bool hasGameTime() => _gameTime != null;

  // "gameStatus" field.
  int? _gameStatus;
  int get gameStatus => _gameStatus ?? 0;
  bool hasGameStatus() => _gameStatus != null;

  // "gameID" field.
  String? _gameID;
  String get gameID => _gameID ?? '';
  bool hasGameID() => _gameID != null;

  // "currentPlayerTurn" field.
  int? _currentPlayerTurn;
  int get currentPlayerTurn => _currentPlayerTurn ?? 0;
  bool hasCurrentPlayerTurn() => _currentPlayerTurn != null;

  // "taslakBoard1" field.
  List<String>? _taslakBoard1;
  List<String> get taslakBoard1 => _taslakBoard1 ?? const [];
  bool hasTaslakBoard1() => _taslakBoard1 != null;

  // "taslakBoard2" field.
  List<String>? _taslakBoard2;
  List<String> get taslakBoard2 => _taslakBoard2 ?? const [];
  bool hasTaslakBoard2() => _taslakBoard2 != null;

  // "sonHamle" field.
  DateTime? _sonHamle;
  DateTime? get sonHamle => _sonHamle;
  bool hasSonHamle() => _sonHamle != null;

  // "usedLetters" field.
  List<String>? _usedLetters;
  List<String> get usedLetters => _usedLetters ?? const [];
  bool hasUsedLetters() => _usedLetters != null;

  // "indexlerBonuslari" field.
  List<IndexVeBonusStruct>? _indexlerBonuslari;
  List<IndexVeBonusStruct> get indexlerBonuslari =>
      _indexlerBonuslari ?? const [];
  bool hasIndexlerBonuslari() => _indexlerBonuslari != null;

  // "taslakLetters1" field.
  List<String>? _taslakLetters1;
  List<String> get taslakLetters1 => _taslakLetters1 ?? const [];
  bool hasTaslakLetters1() => _taslakLetters1 != null;

  // "taslakLetters2" field.
  List<String>? _taslakLetters2;
  List<String> get taslakLetters2 => _taslakLetters2 ?? const [];
  bool hasTaslakLetters2() => _taslakLetters2 != null;

  // "lastMove" field.
  int? _lastMove;
  int get lastMove => _lastMove ?? 0;
  bool hasLastMove() => _lastMove != null;

  // "timeOut" field.
  int? _timeOut;
  int get timeOut => _timeOut ?? 0;
  bool hasTimeOut() => _timeOut != null;

  // "player1blocked" field.
  bool? _player1blocked;
  bool get player1blocked => _player1blocked ?? false;
  bool hasPlayer1blocked() => _player1blocked != null;

  // "player2blocked" field.
  bool? _player2blocked;
  bool get player2blocked => _player2blocked ?? false;
  bool hasPlayer2blocked() => _player2blocked != null;

  // "blockedSide" field.
  int? _blockedSide;
  int get blockedSide => _blockedSide ?? 0;
  bool hasBlockedSide() => _blockedSide != null;

  void _initializeFields() {
    _player1Name = snapshotData['player1Name'] as String?;
    _player1ID = snapshotData['player1ID'] as String?;
    _player2Name = snapshotData['player2Name'] as String?;
    _player2ID = snapshotData['player2ID'] as String?;
    _player1Letters = getDataList(snapshotData['player1Letters']);
    _player2Letters = getDataList(snapshotData['player2Letters']);
    _boardLetters = getDataList(snapshotData['boardLetters']);
    _player1Point = castToType<int>(snapshotData['player1Point']);
    _player2Point = castToType<int>(snapshotData['player2Point']);
    _gameTime = castToType<int>(snapshotData['gameTime']);
    _gameStatus = castToType<int>(snapshotData['gameStatus']);
    _gameID = snapshotData['gameID'] as String?;
    _currentPlayerTurn = castToType<int>(snapshotData['currentPlayerTurn']);
    _taslakBoard1 = getDataList(snapshotData['taslakBoard1']);
    _taslakBoard2 = getDataList(snapshotData['taslakBoard2']);
    _sonHamle = snapshotData['sonHamle'] as DateTime?;
    _usedLetters = getDataList(snapshotData['usedLetters']);
    _indexlerBonuslari = getStructList(
      snapshotData['indexlerBonuslari'],
      IndexVeBonusStruct.fromMap,
    );
    _taslakLetters1 = getDataList(snapshotData['taslakLetters1']);
    _taslakLetters2 = getDataList(snapshotData['taslakLetters2']);
    _lastMove = castToType<int>(snapshotData['lastMove']);
    _timeOut = castToType<int>(snapshotData['timeOut']);
    _player1blocked = snapshotData['player1blocked'] as bool?;
    _player2blocked = snapshotData['player2blocked'] as bool?;
    _blockedSide = castToType<int>(snapshotData['blockedSide']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('singleGame');

  static Stream<SingleGameRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SingleGameRecord.fromSnapshot(s));

  static Future<SingleGameRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SingleGameRecord.fromSnapshot(s));

  static SingleGameRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SingleGameRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SingleGameRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SingleGameRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SingleGameRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SingleGameRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSingleGameRecordData({
  String? player1Name,
  String? player1ID,
  String? player2Name,
  String? player2ID,
  int? player1Point,
  int? player2Point,
  int? gameTime,
  int? gameStatus,
  String? gameID,
  int? currentPlayerTurn,
  DateTime? sonHamle,
  int? lastMove,
  int? timeOut,
  bool? player1blocked,
  bool? player2blocked,
  int? blockedSide,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'player1Name': player1Name,
      'player1ID': player1ID,
      'player2Name': player2Name,
      'player2ID': player2ID,
      'player1Point': player1Point,
      'player2Point': player2Point,
      'gameTime': gameTime,
      'gameStatus': gameStatus,
      'gameID': gameID,
      'currentPlayerTurn': currentPlayerTurn,
      'sonHamle': sonHamle,
      'lastMove': lastMove,
      'timeOut': timeOut,
      'player1blocked': player1blocked,
      'player2blocked': player2blocked,
      'blockedSide': blockedSide,
    }.withoutNulls,
  );

  return firestoreData;
}

class SingleGameRecordDocumentEquality implements Equality<SingleGameRecord> {
  const SingleGameRecordDocumentEquality();

  @override
  bool equals(SingleGameRecord? e1, SingleGameRecord? e2) {
    const listEquality = ListEquality();
    return e1?.player1Name == e2?.player1Name &&
        e1?.player1ID == e2?.player1ID &&
        e1?.player2Name == e2?.player2Name &&
        e1?.player2ID == e2?.player2ID &&
        listEquality.equals(e1?.player1Letters, e2?.player1Letters) &&
        listEquality.equals(e1?.player2Letters, e2?.player2Letters) &&
        listEquality.equals(e1?.boardLetters, e2?.boardLetters) &&
        e1?.player1Point == e2?.player1Point &&
        e1?.player2Point == e2?.player2Point &&
        e1?.gameTime == e2?.gameTime &&
        e1?.gameStatus == e2?.gameStatus &&
        e1?.gameID == e2?.gameID &&
        e1?.currentPlayerTurn == e2?.currentPlayerTurn &&
        listEquality.equals(e1?.taslakBoard1, e2?.taslakBoard1) &&
        listEquality.equals(e1?.taslakBoard2, e2?.taslakBoard2) &&
        e1?.sonHamle == e2?.sonHamle &&
        listEquality.equals(e1?.usedLetters, e2?.usedLetters) &&
        listEquality.equals(e1?.indexlerBonuslari, e2?.indexlerBonuslari) &&
        listEquality.equals(e1?.taslakLetters1, e2?.taslakLetters1) &&
        listEquality.equals(e1?.taslakLetters2, e2?.taslakLetters2) &&
        e1?.lastMove == e2?.lastMove &&
        e1?.timeOut == e2?.timeOut &&
        e1?.player1blocked == e2?.player1blocked &&
        e1?.player2blocked == e2?.player2blocked &&
        e1?.blockedSide == e2?.blockedSide;
  }

  @override
  int hash(SingleGameRecord? e) => const ListEquality().hash([
        e?.player1Name,
        e?.player1ID,
        e?.player2Name,
        e?.player2ID,
        e?.player1Letters,
        e?.player2Letters,
        e?.boardLetters,
        e?.player1Point,
        e?.player2Point,
        e?.gameTime,
        e?.gameStatus,
        e?.gameID,
        e?.currentPlayerTurn,
        e?.taslakBoard1,
        e?.taslakBoard2,
        e?.sonHamle,
        e?.usedLetters,
        e?.indexlerBonuslari,
        e?.taslakLetters1,
        e?.taslakLetters2,
        e?.lastMove,
        e?.timeOut,
        e?.player1blocked,
        e?.player2blocked,
        e?.blockedSide
      ]);

  @override
  bool isValidKey(Object? o) => o is SingleGameRecord;
}
