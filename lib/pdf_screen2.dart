import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upwork_fix/preference_helper.dart';

class PdfSample2View extends StatefulWidget {
  final String? path;
  final int? lastPage;

  const PdfSample2View({Key? key, this.path, this.lastPage}) : super(key: key);
  @override
  _PdfSample2ViewState createState() => _PdfSample2ViewState();
}

class _PdfSample2ViewState extends State<PdfSample2View> {
  PdfController? _pdfController;
  int? pages = 0;
  int? currentPage = 0;

  Future<SharedPreferences>? _preferences;

  SharedPreferenceHelper? _preferenceHelper;

  @override
  void initState() {
    //init shared preference
    _preferences = SharedPreferences.getInstance();
    _preferenceHelper = SharedPreferenceHelper(_preferences!);
    _pdfController = PdfController(
        document: PdfDocument.openFile(widget.path!),
        initialPage: widget.lastPage!);

    super.initState();
  }

  @override
  void dispose() {
    _pdfController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Page $currentPage/$pages"),
        ),
        body: PdfView(
          controller: _pdfController!,
          scrollDirection: Axis.vertical,
          onDocumentLoaded: (PdfDocument d) {
            setState(() {
              pages = d.pagesCount;
            });
          

            // _pdfController?.animateToPage(widget.lastPage!,
            //     duration: const Duration(seconds: 1), curve: Curves.ease);
          },
          onPageChanged: (page) {
            setState(() {
              currentPage = page;
            });
            //save last page
            _preferenceHelper?.saveLastPage(page);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _animateToTop(),
          child: Icon(Icons.align_vertical_top),
        ));
  }

  _animateToTop() {
    _pdfController?.animateToPage(0,
        duration: const Duration(seconds: 1), curve: Curves.ease);
  }
}
