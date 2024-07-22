import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PdfReader extends StatefulWidget {
  final String filePath;
  const PdfReader({super.key, required this.filePath});

  @override
  State<PdfReader> createState() => PdfReaderState();
}

class PdfReaderState extends State<PdfReader> {
  late PdfControllerPinch _pdfControllerPinch;

  int _currentPage = 0;
  int _totalPage = 0;

  @override
  void initState() {
    super.initState();
    _pdfControllerPinch =
        PdfControllerPinch(document: PdfDocument.openFile(widget.filePath));
    _loadDocument();
  }

  @override
  void dispose() {
    _pdfControllerPinch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PdfViewPinch(
            scrollDirection: Axis.vertical,
            controller: _pdfControllerPinch,
            onDocumentLoaded: (page) {
              setState(() {
                _totalPage = page.pagesCount;
              });
            },
            onPageChanged: (page) {
              setState(() {
                _currentPage = page;
              });
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Page ${_currentPage + 1} of $_totalPage'),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      _pdfControllerPinch.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  IconButton(
                    onPressed: () {
                      _pdfControllerPinch.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                    icon: const Icon(Icons.arrow_right),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Future<void> _loadDocument() async {
    final pageCount = _pdfControllerPinch.pagesCount;
    setState(() {
      _totalPage = pageCount ?? 0;
    });
  }
}
