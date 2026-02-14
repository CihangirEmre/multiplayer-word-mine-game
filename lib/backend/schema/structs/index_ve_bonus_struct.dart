// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IndexVeBonusStruct extends FFFirebaseStruct {
  IndexVeBonusStruct({
    int? index,
    String? bonusTipi,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _index = index,
        _bonusTipi = bonusTipi,
        super(firestoreUtilData);

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  set index(int? val) => _index = val;

  void incrementIndex(int amount) => index = index + amount;

  bool hasIndex() => _index != null;

  // "bonusTipi" field.
  String? _bonusTipi;
  String get bonusTipi => _bonusTipi ?? '';
  set bonusTipi(String? val) => _bonusTipi = val;

  bool hasBonusTipi() => _bonusTipi != null;

  static IndexVeBonusStruct fromMap(Map<String, dynamic> data) =>
      IndexVeBonusStruct(
        index: castToType<int>(data['index']),
        bonusTipi: data['bonusTipi'] as String?,
      );

  static IndexVeBonusStruct? maybeFromMap(dynamic data) => data is Map
      ? IndexVeBonusStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'index': _index,
        'bonusTipi': _bonusTipi,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'index': serializeParam(
          _index,
          ParamType.int,
        ),
        'bonusTipi': serializeParam(
          _bonusTipi,
          ParamType.String,
        ),
      }.withoutNulls;

  static IndexVeBonusStruct fromSerializableMap(Map<String, dynamic> data) =>
      IndexVeBonusStruct(
        index: deserializeParam(
          data['index'],
          ParamType.int,
          false,
        ),
        bonusTipi: deserializeParam(
          data['bonusTipi'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'IndexVeBonusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IndexVeBonusStruct &&
        index == other.index &&
        bonusTipi == other.bonusTipi;
  }

  @override
  int get hashCode => const ListEquality().hash([index, bonusTipi]);
}

IndexVeBonusStruct createIndexVeBonusStruct({
  int? index,
  String? bonusTipi,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IndexVeBonusStruct(
      index: index,
      bonusTipi: bonusTipi,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

IndexVeBonusStruct? updateIndexVeBonusStruct(
  IndexVeBonusStruct? indexVeBonus, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    indexVeBonus
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIndexVeBonusStructData(
  Map<String, dynamic> firestoreData,
  IndexVeBonusStruct? indexVeBonus,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (indexVeBonus == null) {
    return;
  }
  if (indexVeBonus.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && indexVeBonus.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final indexVeBonusData =
      getIndexVeBonusFirestoreData(indexVeBonus, forFieldValue);
  final nestedData =
      indexVeBonusData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = indexVeBonus.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIndexVeBonusFirestoreData(
  IndexVeBonusStruct? indexVeBonus, [
  bool forFieldValue = false,
]) {
  if (indexVeBonus == null) {
    return {};
  }
  final firestoreData = mapToFirestore(indexVeBonus.toMap());

  // Add any Firestore field values
  indexVeBonus.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIndexVeBonusListFirestoreData(
  List<IndexVeBonusStruct>? indexVeBonuss,
) =>
    indexVeBonuss?.map((e) => getIndexVeBonusFirestoreData(e, true)).toList() ??
    [];
