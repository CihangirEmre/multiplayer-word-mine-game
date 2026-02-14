import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<String>? resetEveryContainer() {
  final specialIndexes = {17, 22, 35, 84, 150};

  return List.generate(
    225,
    (index) => specialIndexes.contains(index) ? 'a' : '*',
  );
}

List<int> ekstraHamleEngeliDenkGelenler(
  List<IndexVeBonusStruct> indexVeBonus,
  List<int> newIndexes,
) {
  return indexVeBonus
      .where((item) =>
          item.bonusTipi == "Ekstra Hamle Engeli" &&
          newIndexes.contains(item.index))
      .map((item) => item.index)
      .toList();
}

List<int> kelimeIptaliDenkGelenler(
  List<IndexVeBonusStruct> indexVeBonus,
  List<int> newIndexes,
) {
  return indexVeBonus
      .where((item) =>
          item.bonusTipi == "Kelime İptali" && newIndexes.contains(item.index))
      .map((item) => item.index)
      .toList();
}

List<String>? setPlayerLetters() {
  return ['A', 'B', 'C', 'D', 'E', 'F', 'G'];
}

int getPointOfLetter(String inputLetter) {
  const Map<String, int> letterPoints = {
    'A': 1,
    'B': 3,
    'C': 4,
    'Ç': 4,
    'D': 3,
    'E': 1,
    'F': 7,
    'G': 5,
    'Ğ': 8,
    'H': 5,
    'I': 2,
    'İ': 1,
    'J': 10,
    'K': 1,
    'L': 1,
    'M': 2,
    'N': 1,
    'O': 2,
    'Ö': 7,
    'P': 5,
    'R': 1,
    'S': 2,
    'Ş': 4,
    'T': 1,
    'U': 2,
    'Ü': 3,
    'V': 7,
    'Y': 3,
    'Z': 4,
    'JOKER': 0,
  };

  // Girilen harfi büyük harfe çevir
  String letter = inputLetter.toUpperCase();

  // Harf puanını döndür, bilinmeyen harf için 0 döner
  return letterPoints[letter] ?? 0;
}

Color getColorForContainer(int containerIndex) {
  if ([2, 12, 30, 44, 180, 212, 194, 222].contains(containerIndex)) {
    return Color(0xFFBEAA91); // BEAA91 kodu
  } else if ([16, 28, 64, 154, 70, 160, 196, 208].contains(containerIndex)) {
    return Color(0xFFDEA094); // DEA094 kodu
  } else if ([
    5,
    9,
    21,
    23,
    75,
    91,
    121,
    135,
    215,
    201,
    203,
    219,
    89,
    103,
    133,
    149,
    96,
    80,
    98,
    84,
    128,
    144,
    126,
    140
  ].contains(containerIndex)) {
    return Color(0xFF6EBEFF); // 6EBEFF kodu
  } else if ([107, 37, 48, 56, 117, 176, 187, 168].contains(containerIndex)) {
    return Color(0xFF7EE1AA); // 7EE1AA kodu
  } else if (containerIndex == 112) {
    return Color(0xFFF3CD87); // F3CD87 kodu
  } else {
    return Color(0xFFE1E1E1); // E1E1E1 kodu
  }
}

String getEmptyBonusLetters(int? index) {
  if (index == null) return "";

  List<int> kList = [
    2,
    12,
    30,
    44,
    180,
    212,
    194,
    222,
    107,
    37,
    48,
    56,
    117,
    176,
    187,
    168
  ];
  List<int> hList = [
    16,
    28,
    64,
    154,
    70,
    160,
    196,
    208,
    5,
    9,
    21,
    23,
    75,
    91,
    121,
    135,
    215,
    201,
    203,
    219,
    89,
    103,
    133,
    149,
    96,
    80,
    98,
    84,
    128,
    144,
    126,
    140
  ];

  if (index == 112) return "#";
  if (kList.contains(index)) return "K";
  if (hList.contains(index)) return "H";
  return "";
}

int getEmptyBonusPoints(int index) {
  List<int> return3 = [
    2,
    12,
    30,
    44,
    180,
    212,
    194,
    222,
    16,
    28,
    64,
    154,
    70,
    160,
    196,
    208
  ];
  List<int> return2 = [
    5,
    9,
    21,
    23,
    75,
    91,
    121,
    135,
    215,
    201,
    203,
    219,
    89,
    103,
    133,
    149,
    96,
    80,
    98,
    84,
    128,
    144,
    126,
    140,
    107,
    37,
    48,
    56,
    117,
    176,
    187,
    168,
    112
  ];

  if (return3.contains(index)) {
    return 3;
  } else if (return2.contains(index)) {
    return 2;
  } else {
    return 0; // veya istersen başka bir şey
  }
}

List<String> give14RandomLetters() {
  final Map<String, int> letterLimits = {
    'A': 12,
    'M': 4,
    'B': 2,
    'N': 5,
    'C': 2,
    'O': 3,
    'Ç': 2,
    'Ö': 1,
    'D': 2,
    'P': 1,
    'E': 8,
    'R': 6,
    'F': 1,
    'S': 3,
    'G': 1,
    'Ş': 2,
    'Ğ': 1,
    'T': 5,
    'H': 1,
    'U': 3,
    'I': 4,
    'Ü': 2,
    'İ': 7,
    'V': 1,
    'J': 1,
    'Y': 2,
    'K': 7,
    'Z': 2,
    'L': 7
  };

  // Tüm harfleri, limitleri kadar içeren bir havuz oluştur
  List<String> letterPool = [];
  letterLimits.forEach((letter, count) {
    letterPool.addAll(List.filled(count, letter));
  });

  // Havuzu karıştır
  letterPool.shuffle(math.Random());

  // İlk 7 harfi seç
  return letterPool.take(14).toList();
}

List<String> setEmptyBoard() {
  return List<String>.filled(225, '*');
}

int bonussuzEklenecekPuanHesaplama(
  List<String> boardLetters,
  List<int> newIndexes,
) {
  final harfPuani = {
    'A': 1,
    'B': 3,
    'C': 4,
    'Ç': 4,
    'D': 3,
    'E': 1,
    'F': 7,
    'G': 5,
    'Ğ': 8,
    'H': 5,
    'I': 2,
    'İ': 1,
    'J': 10,
    'K': 1,
    'L': 1,
    'M': 2,
    'N': 1,
    'O': 2,
    'Ö': 7,
    'P': 5,
    'R': 1,
    'S': 2,
    'Ş': 4,
    'T': 1,
    'U': 2,
    'Ü': 3,
    'V': 7,
    'Y': 3,
    'Z': 4,
  };
  final kelime3x = {227};
  final harf3x = {227};
  final harf2x = {227};
  final kelime2x = {227};
  final ekstra2puan = {227};

  final Set<String> yataydaBulunanKelimeler = {};
  final Set<String> dikeydeBulunanKelimeler = {};
  int toplamPuan = 0;

  for (int index in newIndexes) {
    // --- Yatay kelime ---
    String yatayKelime = yataydaKelimeBul(index, boardLetters, 15);
    if (yatayKelime.isNotEmpty &&
        !yataydaBulunanKelimeler.contains(yatayKelime)) {
      yataydaBulunanKelimeler.add(yatayKelime);
      int kelimePuan = 0;

      for (int i = 0; i < yatayKelime.length; i++) {
        String harf = yatayKelime[i].toUpperCase();
        kelimePuan += harfPuani[harf] ?? 0;
      }

      int bonusIndex =
          index; // sadece bu yeni yerleştirilen harfin bonusu önemli
      int kelimeCarpani = 1;
      if (kelime3x.contains(bonusIndex))
        kelimeCarpani *= 3;
      else if (kelime2x.contains(bonusIndex))
        kelimeCarpani *= 2;
      else if (harf3x.contains(bonusIndex))
        kelimePuan +=
            (harfPuani[boardLetters[bonusIndex].toUpperCase()] ?? 0) * 2;
      else if (harf2x.contains(bonusIndex))
        kelimePuan += (harfPuani[boardLetters[bonusIndex].toUpperCase()] ?? 0);

      kelimePuan *= kelimeCarpani;
      if (ekstra2puan.contains(bonusIndex)) kelimePuan += 2;

      toplamPuan += kelimePuan;
    }

    // --- Dikey kelime ---
    String dikeyKelime = dikeydaKelimeBul(index, boardLetters, 15);
    if (dikeyKelime.isNotEmpty &&
        !dikeydeBulunanKelimeler.contains(dikeyKelime)) {
      dikeydeBulunanKelimeler.add(dikeyKelime);
      int kelimePuan = 0;

      for (int i = 0; i < dikeyKelime.length; i++) {
        String harf = dikeyKelime[i].toUpperCase();
        kelimePuan += harfPuani[harf] ?? 0;
      }

      int bonusIndex = index;
      int kelimeCarpani = 1;
      if (kelime3x.contains(bonusIndex))
        kelimeCarpani *= 3;
      else if (kelime2x.contains(bonusIndex))
        kelimeCarpani *= 2;
      else if (harf3x.contains(bonusIndex))
        kelimePuan +=
            (harfPuani[boardLetters[bonusIndex].toUpperCase()] ?? 0) * 2;
      else if (harf2x.contains(bonusIndex))
        kelimePuan += (harfPuani[boardLetters[bonusIndex].toUpperCase()] ?? 0);

      kelimePuan *= kelimeCarpani;
      if (ekstra2puan.contains(bonusIndex)) kelimePuan += 2;

      toplamPuan += kelimePuan;
    }
  }

  return toplamPuan;
}

List<String> getArrayAndSetAnIndex(
  int index,
  String value,
  List<String> oldArray,
) {
  List<String> newArray = List.from(oldArray);
  if (index < newArray.length) {
    newArray[index] = value;
  } else if (index == newArray.length) {
    newArray.add(value);
  } else {
    // Eğer index çok büyükse (örneğin boşluk varsa) onu da doldurmak istersen:
    newArray.length = index;
    newArray.add(value);
  }
  return newArray;
}

List<String> yeniKelimeleriKontrolEt(
  List<String> taslakBoard,
  List<String> boardLetters,
) {
  List<String> bulunanKelimeler = [];

  // Grid boyutu
  const int gridBoyutu = 15;

  // Yeni harflerin pozisyonlarını bul
  List<int> yeniHarfIndeksleri = yeniHarfleriTespit(taslakBoard, boardLetters);

  // Yeni harf yoksa boş liste döndür
  if (yeniHarfIndeksleri.isEmpty) {
    return [];
  }

  // Yeni harfler mevcut harflere bağlı mı kontrol et
  bool bagliMi =
      yeniHarflerBaglantiliMi(yeniHarfIndeksleri, boardLetters, gridBoyutu);

  // Bağlı değilse ve tahtada başka harf yoksa, merkeze yerleştirilmeli
  bool merkezKullanildi = false;
  if (!bagliMi) {
    // Merkez indeks (112) kullanıldı mı kontrol et
    for (int indeks in yeniHarfIndeksleri) {
      if (indeks == 112) {
        merkezKullanildi = true;
        break;
      }
    }

    // Eğer merkez kullanılmadıysa ve tahtada başka harf yoksa "wrongplacement" döndür
    bool tahtadaHarfVar = boardLettersHarfVarMi(boardLetters);
    if (!merkezKullanildi && !tahtadaHarfVar) {
      return ["wrongplacement"];
    }
  }

  // Yeni harflerin yatay ve dikey yönlerde oluşturduğu kelimeleri bul
  Set<String> kelimeKumesi = Set<String>();

  // Yatay kelimeleri bul
  for (int indeks in yeniHarfIndeksleri) {
    String yatayKelime = yataydaKelimeBul(indeks, taslakBoard, gridBoyutu);
    if (yatayKelime.length > 1) {
      kelimeKumesi.add(yatayKelime);
    }
  }

  // Dikey kelimeleri bul
  for (int indeks in yeniHarfIndeksleri) {
    String dikeyKelime = dikeydaKelimeBul(indeks, taslakBoard, gridBoyutu);
    if (dikeyKelime.length > 1) {
      kelimeKumesi.add(dikeyKelime);
    }
  }

  // Set'i List'e dönüştür
  bulunanKelimeler = kelimeKumesi.toList();

  // Eğer hiç kelime bulunamadıysa ve harfler bağlantılı değilse "wrongplacement" döndür
  if (bulunanKelimeler.isEmpty && !bagliMi && tahtadaHarfVar(boardLetters)) {
    return ["wrongplacement"];
  }

  return bulunanKelimeler;
}

List<int> yeniHarfleriTespit(
  List<String> taslakBoard,
  List<String> boardLetters,
) {
  List<int> yeniHarfIndeksleri = [];

  for (int i = 0; i < taslakBoard.length; i++) {
    // Eğer taslakBoard'da bir harf var ama boardLetters'da boşsa, bu yeni bir harftir
    if (taslakBoard[i] != "*" && boardLetters[i] == "*") {
      yeniHarfIndeksleri.add(i);
    }
  }

  return yeniHarfIndeksleri;
}

bool yeniHarflerBaglantiliMi(
  List<int> yeniHarfIndeksleri,
  List<String> boardLetters,
  int gridBoyutu,
) {
  for (int indeks in yeniHarfIndeksleri) {
    // Üst, alt, sağ ve sol komşuları kontrol et
    List<int> komsular = [];

    // Üst komşu
    if (indeks >= gridBoyutu) {
      komsular.add(indeks - gridBoyutu);
    }

    // Alt komşu
    if (indeks < boardLetters.length - gridBoyutu) {
      komsular.add(indeks + gridBoyutu);
    }

    // Sol komşu (aynı satırda olduğundan emin ol)
    if (indeks % gridBoyutu > 0) {
      komsular.add(indeks - 1);
    }

    // Sağ komşu (aynı satırda olduğundan emin ol)
    if (indeks % gridBoyutu < gridBoyutu - 1) {
      komsular.add(indeks + 1);
    }

    // Komşuların herhangi birinde boardLetters'da harf var mı kontrol et
    for (int komsu in komsular) {
      if (boardLetters[komsu] != "*") {
        return true;
      }
    }
  }

  return false;
}

String yataydaKelimeBul(
  int indeks,
  List<String> board,
  int gridBoyutu,
) {
  int satir = indeks ~/ gridBoyutu;
  int baslangicIndeks = satir * gridBoyutu;
  int bitisIndeks = baslangicIndeks + gridBoyutu - 1;

  // Kelime başlangıcını bul (sola doğru)
  int sol = indeks;
  while (sol > baslangicIndeks && board[sol - 1] != "*") {
    sol--;
  }

  // Kelime bitişini bul (sağa doğru)
  int sag = indeks;
  while (sag < bitisIndeks && board[sag + 1] != "*") {
    sag++;
  }

  // Eğer kelime birden fazla karakterse, oluştur
  if (sag - sol >= 1) {
    String kelime = "";
    for (int i = sol; i <= sag; i++) {
      kelime += board[i];
    }
    return kelime;
  }

  return "";
}

String dikeydaKelimeBul(
  int indeks,
  List<String> board,
  int gridBoyutu,
) {
  int sutun = indeks % gridBoyutu;

  // Kelime başlangıcını bul (yukarı doğru)
  int ust = indeks;
  while (ust >= gridBoyutu && board[ust - gridBoyutu] != "*") {
    ust -= gridBoyutu;
  }

  // Kelime bitişini bul (aşağı doğru)
  int alt = indeks;
  while (alt + gridBoyutu < board.length && board[alt + gridBoyutu] != "*") {
    alt += gridBoyutu;
  }

  // Eğer kelime birden fazla karakterse, oluştur
  if ((alt - ust) / gridBoyutu >= 1) {
    String kelime = "";
    for (int i = ust; i <= alt; i += gridBoyutu) {
      kelime += board[i];
    }
    return kelime;
  }

  return "";
}

bool tahtadaHarfVar(List<String> board) {
  for (String harf in board) {
    if (harf != "*") {
      return true;
    }
  }
  return false;
}

bool boardLettersHarfVarMi(List<String> boardLetters) {
  for (String harf in boardLetters) {
    if (harf != "*") {
      return true;
    }
  }
  return false;
}

List<String> listedenKelimeKontrolEt(
  List<String> olusturulanKelimeler,
  dynamic kelimeListesiJSON,
) {
  List<String> kelimeListesi = List<String>.from(
      kelimeListesiJSON); // JSON'dan gelen kelimeleri listeye çevir
  List<String> eslesmeyenKelimeler = [];

  for (var kelime in olusturulanKelimeler) {
    if (!kelimeListesi.contains(kelime)) {
      eslesmeyenKelimeler.add(
          kelime); // Eğer kelime listede yoksa, eşleşmeyenler listesine ekle
    }
  }

  if (eslesmeyenKelimeler.isEmpty) {
    return ["allcorrect"]; // Eğer eşleşmeyen kelime yoksa, "allcorrect" döndür
  } else {
    return eslesmeyenKelimeler; // Eşleşmeyen kelimeleri döndür
  }
}

List<String> setEmptyStringList() {
  return [];
}

List<int> puanBolunmesiDenkGelenler(
  List<IndexVeBonusStruct> indexVeBonus,
  List<int> newIndexes,
) {
  return indexVeBonus
      .where((item) =>
          item.bonusTipi == "Puan Bölünmesi" && newIndexes.contains(item.index))
      .map((item) => item.index)
      .toList();
}

List<String> mergeStringList(
  List<String> firstList,
  List<String> secondList,
) {
  return [...firstList, ...secondList];
}

List<String> kullanilanHarflerSilindi(
  List<String> eskiTahta,
  List<String> yeniTahta,
  List<String> kullanicininHarfleri,
) {
  List<String> fark = [];
  for (int i = 0; i < eskiTahta.length; i++) {
    String eski = eskiTahta[i];
    String yeni = yeniTahta[i];
    if (eski == '*' && yeni != '*') {
      fark.add(yeni);
    }
  }

  // Kullanicinin harflerinden fark listesindeki harfleri çıkar
  List<String> sonuc = List.from(kullanicininHarfleri);
  for (String harf in fark) {
    sonuc.remove(
        harf); // ilk bulduğu harfi siler, tekrar eden harfler için tekrar silinir
  }

  return sonuc;
}

List<String> yeniHarflerinListesiniVer(
  List<String> kullanilmisHarfler,
  List<String> kullanicininHarfleri,
) {
  final Map<String, int> harfLimitleri = {
    'A': 12,
    'B': 2,
    'C': 2,
    'Ç': 2,
    'D': 2,
    'E': 8,
    'F': 1,
    'G': 1,
    'Ğ': 1,
    'H': 1,
    'I': 4,
    'İ': 7,
    'J': 1,
    'K': 7,
    'L': 7,
    'M': 4,
    'N': 5,
    'O': 3,
    'Ö': 1,
    'P': 1,
    'R': 6,
    'S': 3,
    'Ş': 2,
    'T': 5,
    'U': 3,
    'Ü': 2,
    'V': 1,
    'Y': 2,
    'Z': 2,
    '?': 2,
  };

  final Map<String, int> kullanilmisSayilari = {};
  for (var harf in kullanilmisHarfler) {
    kullanilmisSayilari[harf] = (kullanilmisSayilari[harf] ?? 0) + 1;
  }

  int toplamKullanilmis = kullanilmisHarfler.length;
  if (toplamKullanilmis >= 100) {
    return []; // Harf havuzu dolu, yeni harf verilemez
  }

  final List<String> kalanHarfler = [];
  harfLimitleri.forEach((harf, limit) {
    int kullanilan = kullanilmisSayilari[harf] ?? 0;
    int kalan = limit - kullanilan;
    if (kalan > 0) {
      kalanHarfler.addAll(List.filled(kalan, harf));
    }
  });

  int eksikHarfSayisi = 7 - kullanicininHarfleri.length;
  // Havuz kapasitesi kadar harf verilebilir
  int verilebilecekHarfSayisi =
      math.min(eksikHarfSayisi, 100 - toplamKullanilmis);

  final random = math.Random();
  final List<String> eklenecekHarfler = [];

  for (int i = 0; i < verilebilecekHarfSayisi && kalanHarfler.isNotEmpty; i++) {
    int index = random.nextInt(kalanHarfler.length);
    eklenecekHarfler.add(kalanHarfler[index]);
    kalanHarfler.removeAt(index);
  }

  return eklenecekHarfler;
}

List<String> getFirst7Index(List<String> stringList) {
  return stringList.sublist(0, 7);
}

List<String> getLast7Index(List<String> stringList) {
  return stringList.sublist(7, 14);
}

List<IndexVeBonusStruct> bonuslariIndexeYerlestir() {
  List<IndexVeBonusStruct> bonuslar = [];
  List<String> bonusTipleri = [
    'Puan Bölünmesi',
    'Puan Transferi',
    'Harf Kaybı',
    'Ekstra Hamle Engeli',
    'Kelime İptali',
    'Bölge Yasağı',
    'Harf Yasağı',
    'Ekstra Hamle Jokeri'
  ];

  List<int> bonusMiktarlari = [5, 4, 3, 2, 2, 2, 3, 2];

  List<int> indexler =
      List.generate(225, (index) => index); // 0'dan 224'e kadar olan indexler

  // Rastgele sıralama
  math.Random random = math.Random();
  indexler.shuffle(random); // Indexleri karıştır

  // Bonusları yerleştir
  int bonusIndex = 0;
  for (int i = 0; i < bonusMiktarlari.length; i++) {
    for (int j = 0; j < bonusMiktarlari[i]; j++) {
      // Bonus yerleştirme işlemi
      bonuslar.add(IndexVeBonusStruct(
          index:
              indexler[bonusIndex], // Rastgele sırayla seçilen benzersiz index
          bonusTipi: bonusTipleri[i]));
      bonusIndex++;
    }
  }

  return bonuslar;
}

List<String> deleteLetterFromArray(
  String deletedCharacter,
  List<String> oldArray,
) {
  List<String> newArray = List.from(oldArray);
  int index = newArray.indexOf(deletedCharacter);
  if (index != -1) {
    newArray.removeAt(index);
  }
  return newArray;
}

int calculatePoints(
  List<String> newIndexes,
  List<String> boardLetters,
  List<IndexVeBonusStruct> bonuslar,
) {
  return 1;
}

int timeOutDegeriHesapla(
  int currentTime,
  int gameTime,
) {
  int eklemeMs = 0;

  if (gameTime == 2 || gameTime == 5) {
    eklemeMs = gameTime * 60 * 1000; // dakika → ms
  } else if (gameTime == 12 || gameTime == 24) {
    eklemeMs = gameTime * 60 * 60 * 1000; // saat → ms
  }

  return currentTime + eklemeMs;
}

bool doesPasswordFit(String password) {
  final hasMinLength = password.length >= 8;
  final hasUppercase = password.contains(RegExp(r'[A-Z]'));
  final hasLowercase = password.contains(RegExp(r'[a-z]'));
  final hasDigit = password.contains(RegExp(r'\d'));

  return hasMinLength && hasUppercase && hasLowercase && hasDigit;
}

List<String> didPlayerGetBonus(
  List<IndexVeBonusStruct> indexAndBonus,
  List<int> playerIndexes,
) {
  return indexAndBonus
      .where((item) => playerIndexes.contains(item.index))
      .map((item) => item.bonusTipi)
      .toList();
}

int eklenecekPuanHesaplama(
  List<String> boardLetters,
  List<int> newIndexes,
  List<int> puanBolunmesiIndex,
) {
  final harfPuani = {
    'A': 1,
    'B': 3,
    'C': 4,
    'Ç': 4,
    'D': 3,
    'E': 1,
    'F': 7,
    'G': 5,
    'Ğ': 8,
    'H': 5,
    'I': 2,
    'İ': 1,
    'J': 10,
    'K': 1,
    'L': 1,
    'M': 2,
    'N': 1,
    'O': 2,
    'Ö': 7,
    'P': 5,
    'R': 1,
    'S': 2,
    'Ş': 4,
    'T': 1,
    'U': 2,
    'Ü': 3,
    'V': 7,
    'Y': 3,
    'Z': 4,
  };
  final kelime3x = {2, 12, 30, 44, 180, 212, 194, 222};
  final harf3x = {16, 28, 64, 154, 70, 160, 196, 208};
  final harf2x = {
    5,
    9,
    21,
    23,
    75,
    91,
    121,
    135,
    215,
    201,
    203,
    219,
    89,
    103,
    133,
    149,
    96,
    80,
    98,
    84,
    128,
    144,
    126,
    140
  };
  final kelime2x = {107, 37, 48, 56, 117, 176, 187, 168};
  final ekstra2puan = {112};

  final Set<String> yataydaBulunanKelimeler = {};
  final Set<String> dikeydeBulunanKelimeler = {};
  int toplamPuan = 0;

  for (int index in newIndexes) {
    // --- Yatay kelime ---
    String yatayKelime = yataydaKelimeBul(index, boardLetters, 15);
    if (yatayKelime.isNotEmpty &&
        !yataydaBulunanKelimeler.contains(yatayKelime)) {
      yataydaBulunanKelimeler.add(yatayKelime);
      int kelimePuan = 0;

      for (int i = 0; i < yatayKelime.length; i++) {
        String harf = yatayKelime[i].toUpperCase();
        kelimePuan += harfPuani[harf] ?? 0;
      }

      int bonusIndex =
          index; // sadece bu yeni yerleştirilen harfin bonusu önemli
      int kelimeCarpani = 1;
      if (kelime3x.contains(bonusIndex))
        kelimeCarpani *= 3;
      else if (kelime2x.contains(bonusIndex))
        kelimeCarpani *= 2;
      else if (harf3x.contains(bonusIndex))
        kelimePuan +=
            (harfPuani[boardLetters[bonusIndex].toUpperCase()] ?? 0) * 2;
      else if (harf2x.contains(bonusIndex))
        kelimePuan += (harfPuani[boardLetters[bonusIndex].toUpperCase()] ?? 0);

      kelimePuan *= kelimeCarpani;
      if (ekstra2puan.contains(bonusIndex)) kelimePuan += 2;
      if (puanBolunmesiIndex.contains(bonusIndex)) {
        kelimePuan = (kelimePuan * 0.7).round(); // %30 azalt
      }
      toplamPuan += kelimePuan;
    }

    // --- Dikey kelime ---
    String dikeyKelime = dikeydaKelimeBul(index, boardLetters, 15);
    if (dikeyKelime.isNotEmpty &&
        !dikeydeBulunanKelimeler.contains(dikeyKelime)) {
      dikeydeBulunanKelimeler.add(dikeyKelime);
      int kelimePuan = 0;

      for (int i = 0; i < dikeyKelime.length; i++) {
        String harf = dikeyKelime[i].toUpperCase();
        kelimePuan += harfPuani[harf] ?? 0;
      }

      int bonusIndex = index;
      int kelimeCarpani = 1;
      if (kelime3x.contains(bonusIndex))
        kelimeCarpani *= 3;
      else if (kelime2x.contains(bonusIndex))
        kelimeCarpani *= 2;
      else if (harf3x.contains(bonusIndex))
        kelimePuan +=
            (harfPuani[boardLetters[bonusIndex].toUpperCase()] ?? 0) * 2;
      else if (harf2x.contains(bonusIndex))
        kelimePuan += (harfPuani[boardLetters[bonusIndex].toUpperCase()] ?? 0);

      kelimePuan *= kelimeCarpani;
      if (ekstra2puan.contains(bonusIndex)) kelimePuan += 2;
      if (puanBolunmesiIndex.contains(bonusIndex)) {
        kelimePuan = (kelimePuan * 0.7).round(); // %30 azalt
      }
      toplamPuan += kelimePuan;
    }
  }

  return toplamPuan;
}

List<String> legitOlmayanKelimeler(
  List<String> olusturulanKelimeler,
  dynamic assetFile,
) {
  List<String> json = List<String>.from(assetFile);

  return olusturulanKelimeler
      .where((kelime) => !json.contains(kelime.toLowerCase()))
      .toList();
}

String arrayToString(List<String> stringList) {
  return stringList.join(', ');
}

bool butunYeniIndexlerBagliMi(
  List<String> taslakLetters,
  List<int> yeniIndexler,
) {
  for (int index in yeniIndexler) {
    bool bagliMi = false;
    List<int> komsular = [index - 15, index + 15, index - 1, index + 1];

    for (int komsu in komsular) {
      if (komsu >= 0 && komsu < taslakLetters.length) {
        if (taslakLetters[komsu] != '*') {
          bagliMi = true;
          break;
        }
      }
    }

    if (!bagliMi) {
      return false;
    }
  }

  return true;
}

List<int> puanTransferiDenkGelenler(
  List<IndexVeBonusStruct> indexVeBonus,
  List<int> newIndexes,
) {
  return indexVeBonus
      .where((item) =>
          item.bonusTipi == "Puan Transferi" && newIndexes.contains(item.index))
      .map((item) => item.index)
      .toList();
}

List<int> solTarafListesiDondur() {
  List<int> solTaraf = [];

  for (int satir = 0; satir < 15; satir++) {
    for (int sutun = 0; sutun < 7; sutun++) {
      solTaraf.add(satir * 15 + sutun);
    }
  }

  return solTaraf;
}

List<int> sagTarafListesiDondur() {
  List<int> sagTaraf = [];

  for (int satir = 0; satir < 15; satir++) {
    for (int sutun = 8; sutun < 15; sutun++) {
      sagTaraf.add(satir * 15 + sutun);
    }
  }

  return sagTaraf;
}

int oyuncu1HarfleriBitti(List<String> oyuncu2Harfleri) {
  Map<String, int> puanlar = {
    'A': 1,
    'B': 3,
    'C': 4,
    'Ç': 4,
    'D': 3,
    'E': 1,
    'F': 7,
    'G': 5,
    'Ğ': 8,
    'H': 5,
    'I': 2,
    'İ': 1,
    'J': 10,
    'K': 1,
    'L': 1,
    'M': 2,
    'N': 1,
    'O': 2,
    'Ö': 7,
    'P': 5,
    'R': 1,
    'S': 2,
    'Ş': 4,
    'T': 1,
    'U': 2,
    'Ü': 3,
    'V': 7,
    'Y': 3,
    'Z': 4
  };

  int toplamPuan = 0;

  for (String harf in oyuncu2Harfleri) {
    toplamPuan += puanlar[harf.toUpperCase()] ?? 0;
  }

  return toplamPuan;
}

bool girilenJokerLegitMi(String girilenKarakter) {
  const List<String> gecerliKarakterler = [
    'A',
    'B',
    'C',
    'Ç',
    'D',
    'E',
    'F',
    'G',
    'Ğ',
    'H',
    'I',
    'İ',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'Ö',
    'P',
    'R',
    'S',
    'Ş',
    'T',
    'U',
    'Ü',
    'V',
    'Y',
    'Z'
  ];

  return gecerliKarakterler.contains(girilenKarakter);
}

String basariOraniniCikart(
  List<SingleGameRecord> gameDocuments,
  String userID,
) {
  int kazanilanOyunSayisi = 0;
  int kaybedilenOyunSayisi = 0;

  for (final doc in gameDocuments) {
    final player1ID = doc.player1ID;
    final player2ID = doc.player2ID;
    final gameStatus = doc.gameStatus;

    if (player1ID == userID && gameStatus == 1) {
      kazanilanOyunSayisi++;
    } else if (player2ID == userID && gameStatus == 2) {
      kazanilanOyunSayisi++;
    }

    if (player1ID == userID && gameStatus == 2) {
      kaybedilenOyunSayisi++;
    } else if (player2ID == userID && gameStatus == 1) {
      kaybedilenOyunSayisi++;
    }
  }

  final toplamOyunSayisi = kazanilanOyunSayisi + kaybedilenOyunSayisi;

  if (toplamOyunSayisi == 0) return "0/0";

  return "$kazanilanOyunSayisi/$toplamOyunSayisi";
}
