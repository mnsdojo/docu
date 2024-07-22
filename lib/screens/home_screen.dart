import 'package:docu/widgets/pdf_reader.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late PdfControllerPinch pdfControllerPinch;

  String? _pdfFilePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _pickPDF,
            icon: const Icon(Icons.add),
          )
        ],
        title: const Text("Docu"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _pdfFilePath != null
            ? PdfReader(filePath: _pdfFilePath!)
            : const Center(
                child: Text("No Pdf Selected "),
              ),
      ),
    );
  }

  Future<void> _pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      setState(() {
        _pdfFilePath = result.files.single.path;
      });
    }
  }
}
