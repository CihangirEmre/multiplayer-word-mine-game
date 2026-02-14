// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart' show rootBundle; // For loading assets
import 'dart:convert'; // For JSON decoding

Future<dynamic> initializeJSON(String jsonName) async {
  // Add your function code here!
  String jsonString =
      await rootBundle.loadString('assets/jsons/$jsonName.json');

  // Decode the JSON data
  dynamic jsonData = json.decode(jsonString);

  // Return the parsed JSON data
  return jsonData;
}
