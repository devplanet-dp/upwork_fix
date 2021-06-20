import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upwork_fix/ok_alert_dialog.dart';
import 'package:upwork_fix/pdf_api.dart';
import 'package:upwork_fix/pdf_screen2.dart';
import 'package:upwork_fix/pdf_screen.dart';
import 'package:upwork_fix/preference_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<SharedPreferences>? _preferences;

  SharedPreferenceHelper? _preferenceHelper;

  @override
  void initState() {
    //init shared preference
    _preferences = SharedPreferences.getInstance();
    _preferenceHelper = SharedPreferenceHelper(_preferences!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => CustomAlertDialog.okAlertDialog(context,
                  'පසුගිය දිනකදී ශ්‍රී ලංකාව තුළ, ඉන්දියාව පුරා වේගයෙන් පැතිර ගිය,'),
              child: Text('Show dialog'),
            ),
            TextButton(
              onPressed: () async {
                File pdfFile =
                    await PDFApi.loadPdfFromAsset('assets/books/sample.pdf');
                int lastPage = await _preferenceHelper!.lastPage;
                print(lastPage);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PDFScreen(
                      path: pdfFile.path,
                      lastPage: lastPage,
                    ),
                  ),
                );
              },
              child: Text('PDF view'),
            ),
            TextButton(
              onPressed: () async {
                File pdfFile =
                    await PDFApi.loadPdfFromAsset('assets/books/sample.pdf');
                int lastPage = await _preferenceHelper!.lastPage;
                print(lastPage);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PdfSample2View(
                      path: pdfFile.path,
                      lastPage: lastPage,
                    ),
                  ),
                );
              },
              child: Text('PDF view 2'),
            ),
          ],
        ),
      ),
    );
  }
}
