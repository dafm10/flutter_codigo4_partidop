import 'package:flutter/material.dart';
import 'package:flutter_codigo4_partidop/ui/general/colors.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class ProposalPage extends StatefulWidget {
  const ProposalPage({Key? key}) : super(key: key);

  @override
  _ProposalPageState createState() => _ProposalPageState();
}

class _ProposalPageState extends State<ProposalPage> {
  // late significa que va a iniciarse vacio pero luego se le asignará un valor
  late PdfController _pdfController;
  int _initialPage = 1;
  int totalPages = 0;
  int currentPage = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pdfController = PdfController(
      document: PdfDocument.openAsset('assets/docs/Metodoligia_Agile.pdf'),
      initialPage: _initialPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: COLOR_BRAND_PRIMARY,
        title: const Text(
          "Nuestras propuestas",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("$currentPage/$totalPages"),
              ),
            ],
          ),
        ],
      ),
      body: PdfView(
        documentLoader: const Center(child: CircularProgressIndicator()),
        pageLoader: const Center(child: CircularProgressIndicator()),
        controller: _pdfController,
        onDocumentLoaded: (document) {
          setState(() {
            totalPages = document.pagesCount;
            // _allPagesCount = document.pagesCount;
          });
        },
        onPageChanged: (page) {
          setState(() {
            currentPage = page;
          });
        },
      ),
    );
  }
}
