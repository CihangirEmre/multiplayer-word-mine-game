import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<String> _containerletters = ['a', 'c', 'd', 'k', 'l', 'w'];
  List<String> get containerletters => _containerletters;
  set containerletters(List<String> value) {
    _containerletters = value;
  }

  void addToContainerletters(String value) {
    containerletters.add(value);
  }

  void removeFromContainerletters(String value) {
    containerletters.remove(value);
  }

  void removeAtIndexFromContainerletters(int index) {
    containerletters.removeAt(index);
  }

  void updateContainerlettersAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    containerletters[index] = updateFn(_containerletters[index]);
  }

  void insertAtIndexInContainerletters(int index, String value) {
    containerletters.insert(index, value);
  }

  List<int> _containerPoints = [];
  List<int> get containerPoints => _containerPoints;
  set containerPoints(List<int> value) {
    _containerPoints = value;
  }

  void addToContainerPoints(int value) {
    containerPoints.add(value);
  }

  void removeFromContainerPoints(int value) {
    containerPoints.remove(value);
  }

  void removeAtIndexFromContainerPoints(int index) {
    containerPoints.removeAt(index);
  }

  void updateContainerPointsAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    containerPoints[index] = updateFn(_containerPoints[index]);
  }

  void insertAtIndexInContainerPoints(int index, int value) {
    containerPoints.insert(index, value);
  }

  List<String> _currentPlayerLetters = [];
  List<String> get currentPlayerLetters => _currentPlayerLetters;
  set currentPlayerLetters(List<String> value) {
    _currentPlayerLetters = value;
  }

  void addToCurrentPlayerLetters(String value) {
    currentPlayerLetters.add(value);
  }

  void removeFromCurrentPlayerLetters(String value) {
    currentPlayerLetters.remove(value);
  }

  void removeAtIndexFromCurrentPlayerLetters(int index) {
    currentPlayerLetters.removeAt(index);
  }

  void updateCurrentPlayerLettersAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    currentPlayerLetters[index] = updateFn(_currentPlayerLetters[index]);
  }

  void insertAtIndexInCurrentPlayerLetters(int index, String value) {
    currentPlayerLetters.insert(index, value);
  }

  String _selectedLetter = '';
  String get selectedLetter => _selectedLetter;
  set selectedLetter(String value) {
    _selectedLetter = value;
  }

  int _selectedPlayerIndex = 0;
  int get selectedPlayerIndex => _selectedPlayerIndex;
  set selectedPlayerIndex(int value) {
    _selectedPlayerIndex = value;
  }

  int _selectedGameTime = 2;
  int get selectedGameTime => _selectedGameTime;
  set selectedGameTime(int value) {
    _selectedGameTime = value;
  }

  List<int> _wrongIndexes = [];
  List<int> get wrongIndexes => _wrongIndexes;
  set wrongIndexes(List<int> value) {
    _wrongIndexes = value;
  }

  void addToWrongIndexes(int value) {
    wrongIndexes.add(value);
  }

  void removeFromWrongIndexes(int value) {
    wrongIndexes.remove(value);
  }

  void removeAtIndexFromWrongIndexes(int index) {
    wrongIndexes.removeAt(index);
  }

  void updateWrongIndexesAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    wrongIndexes[index] = updateFn(_wrongIndexes[index]);
  }

  void insertAtIndexInWrongIndexes(int index, int value) {
    wrongIndexes.insert(index, value);
  }

  List<String> _yeniKelimeler = [];
  List<String> get yeniKelimeler => _yeniKelimeler;
  set yeniKelimeler(List<String> value) {
    _yeniKelimeler = value;
  }

  void addToYeniKelimeler(String value) {
    yeniKelimeler.add(value);
  }

  void removeFromYeniKelimeler(String value) {
    yeniKelimeler.remove(value);
  }

  void removeAtIndexFromYeniKelimeler(int index) {
    yeniKelimeler.removeAt(index);
  }

  void updateYeniKelimelerAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    yeniKelimeler[index] = updateFn(_yeniKelimeler[index]);
  }

  void insertAtIndexInYeniKelimeler(int index, String value) {
    yeniKelimeler.insert(index, value);
  }

  List<String> _eklenecekHarfler = [];
  List<String> get eklenecekHarfler => _eklenecekHarfler;
  set eklenecekHarfler(List<String> value) {
    _eklenecekHarfler = value;
  }

  void addToEklenecekHarfler(String value) {
    eklenecekHarfler.add(value);
  }

  void removeFromEklenecekHarfler(String value) {
    eklenecekHarfler.remove(value);
  }

  void removeAtIndexFromEklenecekHarfler(int index) {
    eklenecekHarfler.removeAt(index);
  }

  void updateEklenecekHarflerAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    eklenecekHarfler[index] = updateFn(_eklenecekHarfler[index]);
  }

  void insertAtIndexInEklenecekHarfler(int index, String value) {
    eklenecekHarfler.insert(index, value);
  }

  List<String> _creationPlayer1Letters = [];
  List<String> get creationPlayer1Letters => _creationPlayer1Letters;
  set creationPlayer1Letters(List<String> value) {
    _creationPlayer1Letters = value;
  }

  void addToCreationPlayer1Letters(String value) {
    creationPlayer1Letters.add(value);
  }

  void removeFromCreationPlayer1Letters(String value) {
    creationPlayer1Letters.remove(value);
  }

  void removeAtIndexFromCreationPlayer1Letters(int index) {
    creationPlayer1Letters.removeAt(index);
  }

  void updateCreationPlayer1LettersAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    creationPlayer1Letters[index] = updateFn(_creationPlayer1Letters[index]);
  }

  void insertAtIndexInCreationPlayer1Letters(int index, String value) {
    creationPlayer1Letters.insert(index, value);
  }

  List<String> _creationPlayer2Letters = [];
  List<String> get creationPlayer2Letters => _creationPlayer2Letters;
  set creationPlayer2Letters(List<String> value) {
    _creationPlayer2Letters = value;
  }

  void addToCreationPlayer2Letters(String value) {
    creationPlayer2Letters.add(value);
  }

  void removeFromCreationPlayer2Letters(String value) {
    creationPlayer2Letters.remove(value);
  }

  void removeAtIndexFromCreationPlayer2Letters(int index) {
    creationPlayer2Letters.removeAt(index);
  }

  void updateCreationPlayer2LettersAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    creationPlayer2Letters[index] = updateFn(_creationPlayer2Letters[index]);
  }

  void insertAtIndexInCreationPlayer2Letters(int index, String value) {
    creationPlayer2Letters.insert(index, value);
  }

  List<String> _creation14Letters = [];
  List<String> get creation14Letters => _creation14Letters;
  set creation14Letters(List<String> value) {
    _creation14Letters = value;
  }

  void addToCreation14Letters(String value) {
    creation14Letters.add(value);
  }

  void removeFromCreation14Letters(String value) {
    creation14Letters.remove(value);
  }

  void removeAtIndexFromCreation14Letters(int index) {
    creation14Letters.removeAt(index);
  }

  void updateCreation14LettersAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    creation14Letters[index] = updateFn(_creation14Letters[index]);
  }

  void insertAtIndexInCreation14Letters(int index, String value) {
    creation14Letters.insert(index, value);
  }

  List<int> _newIndexes = [];
  List<int> get newIndexes => _newIndexes;
  set newIndexes(List<int> value) {
    _newIndexes = value;
  }

  void addToNewIndexes(int value) {
    newIndexes.add(value);
  }

  void removeFromNewIndexes(int value) {
    newIndexes.remove(value);
  }

  void removeAtIndexFromNewIndexes(int index) {
    newIndexes.removeAt(index);
  }

  void updateNewIndexesAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    newIndexes[index] = updateFn(_newIndexes[index]);
  }

  void insertAtIndexInNewIndexes(int index, int value) {
    newIndexes.insert(index, value);
  }

  List<String> _turBonuslari = [];
  List<String> get turBonuslari => _turBonuslari;
  set turBonuslari(List<String> value) {
    _turBonuslari = value;
  }

  void addToTurBonuslari(String value) {
    turBonuslari.add(value);
  }

  void removeFromTurBonuslari(String value) {
    turBonuslari.remove(value);
  }

  void removeAtIndexFromTurBonuslari(int index) {
    turBonuslari.removeAt(index);
  }

  void updateTurBonuslariAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    turBonuslari[index] = updateFn(_turBonuslari[index]);
  }

  void insertAtIndexInTurBonuslari(int index, String value) {
    turBonuslari.insert(index, value);
  }

  bool _testModu = false;
  bool get testModu => _testModu;
  set testModu(bool value) {
    _testModu = value;
  }

  List<String> _harfKaybiYeniHarfler = [];
  List<String> get harfKaybiYeniHarfler => _harfKaybiYeniHarfler;
  set harfKaybiYeniHarfler(List<String> value) {
    _harfKaybiYeniHarfler = value;
  }

  void addToHarfKaybiYeniHarfler(String value) {
    harfKaybiYeniHarfler.add(value);
  }

  void removeFromHarfKaybiYeniHarfler(String value) {
    harfKaybiYeniHarfler.remove(value);
  }

  void removeAtIndexFromHarfKaybiYeniHarfler(int index) {
    harfKaybiYeniHarfler.removeAt(index);
  }

  void updateHarfKaybiYeniHarflerAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    harfKaybiYeniHarfler[index] = updateFn(_harfKaybiYeniHarfler[index]);
  }

  void insertAtIndexInHarfKaybiYeniHarfler(int index, String value) {
    harfKaybiYeniHarfler.insert(index, value);
  }

  bool _donduracakMi = false;
  bool get donduracakMi => _donduracakMi;
  set donduracakMi(bool value) {
    _donduracakMi = value;
  }

  bool _ekstraIsterMi = false;
  bool get ekstraIsterMi => _ekstraIsterMi;
  set ekstraIsterMi(bool value) {
    _ekstraIsterMi = value;
  }

  int _hangiBolgeBanlansin = 0;
  int get hangiBolgeBanlansin => _hangiBolgeBanlansin;
  set hangiBolgeBanlansin(int value) {
    _hangiBolgeBanlansin = value;
  }

  List<int> _solTarafListesi = [];
  List<int> get solTarafListesi => _solTarafListesi;
  set solTarafListesi(List<int> value) {
    _solTarafListesi = value;
  }

  void addToSolTarafListesi(int value) {
    solTarafListesi.add(value);
  }

  void removeFromSolTarafListesi(int value) {
    solTarafListesi.remove(value);
  }

  void removeAtIndexFromSolTarafListesi(int index) {
    solTarafListesi.removeAt(index);
  }

  void updateSolTarafListesiAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    solTarafListesi[index] = updateFn(_solTarafListesi[index]);
  }

  void insertAtIndexInSolTarafListesi(int index, int value) {
    solTarafListesi.insert(index, value);
  }

  List<int> _sagTarafListesi = [];
  List<int> get sagTarafListesi => _sagTarafListesi;
  set sagTarafListesi(List<int> value) {
    _sagTarafListesi = value;
  }

  void addToSagTarafListesi(int value) {
    sagTarafListesi.add(value);
  }

  void removeFromSagTarafListesi(int value) {
    sagTarafListesi.remove(value);
  }

  void removeAtIndexFromSagTarafListesi(int index) {
    sagTarafListesi.removeAt(index);
  }

  void updateSagTarafListesiAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    sagTarafListesi[index] = updateFn(_sagTarafListesi[index]);
  }

  void insertAtIndexInSagTarafListesi(int index, int value) {
    sagTarafListesi.insert(index, value);
  }

  String _jokerSecildi = '';
  String get jokerSecildi => _jokerSecildi;
  set jokerSecildi(String value) {
    _jokerSecildi = value;
  }

  bool _buTurJokerKullanildi = false;
  bool get buTurJokerKullanildi => _buTurJokerKullanildi;
  set buTurJokerKullanildi(bool value) {
    _buTurJokerKullanildi = value;
  }
}
