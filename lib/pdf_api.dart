import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class PDFApi {

  static Future loadPdfFromAsset(String path) async {
    try{
      final data = await rootBundle.load(path);
      final bytes = data.buffer.asUint8List();
      return _storeFile(path, bytes);
    }
    catch(e){
      return null;
    }
  }


  static Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }
}
