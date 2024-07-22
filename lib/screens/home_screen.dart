import 'package:docu/utils/app_state.dart';
import 'package:docu/widgets/app_drawer.dart';
import 'package:docu/widgets/pdf_reader.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return Consumer<AppState>(builder: (context, appstate, child) {
      return Scaffold(
        drawer: const AppDrawer(appName: "Docu", appVersion: "1.0"),
        appBar: AppBar(
          title: const Text("Docu"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _pickPDF,
          tooltip: "Pick Pdf",
          child: const Icon(Icons.add),
        ),
      );
    });
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
