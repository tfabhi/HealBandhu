import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class MedicineScannerScreen extends StatefulWidget {
  const MedicineScannerScreen({super.key});

  @override
  State<MedicineScannerScreen> createState() => _MedicineScannerScreenState();
}

class _MedicineScannerScreenState extends State<MedicineScannerScreen> {
  final _picker = ImagePicker();
  final _recognizer = TextRecognizer();
  File? _image;
  String _recognizedText = '';
  bool _loading = false;

  Future<void> _pickAndScan() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked == null) return;

    setState(() {
      _image = File(picked.path);
      _recognizedText = '';
      _loading = true;
    });

    try {
      final input = InputImage.fromFilePath(picked.path);
      final result = await _recognizer.processImage(input);
      if (!mounted) return;
      setState(() => _recognizedText = result.text.isEmpty
          ? 'No readable text found. Try a clearer, well-lit image.'
          : result.text);
    } catch (e) {
      if (!mounted) return;
      setState(() => _recognizedText = 'Text recognition failed: $e');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    _recognizer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Medicine label scanner')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Choose a clear photo of a medicine package. The app will extract '
            'visible text; it will not reliably verify expiry or medicine safety.',
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: _loading ? null : _pickAndScan,
            icon: const Icon(Icons.photo_library_outlined),
            label: const Text('Choose image and scan'),
          ),
          if (_image != null) ...[
            const SizedBox(height: 16),
            Image.file(_image!, height: 220, fit: BoxFit.contain),
          ],
          if (_loading) const Center(child: CircularProgressIndicator()),
          if (_recognizedText.isNotEmpty) ...[
            const SizedBox(height: 16),
            const Text('Extracted text',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SelectableText(_recognizedText),
          ],
        ],
      ),
    );
  }
}
