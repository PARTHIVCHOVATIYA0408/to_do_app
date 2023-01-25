import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelectImageScreen extends StatefulWidget {
  const SelectImageScreen({super.key});

  @override
  State<SelectImageScreen> createState() => _SelectImageScreenState();
}

class _SelectImageScreenState extends State<SelectImageScreen> {
  final ImagePicker picker = ImagePicker();

  XFile? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageFile == null
                  ? const SizedBox()
                  : Image.file(
                      File(imageFile!.path),
                    ),
              ElevatedButton(
                onPressed: () async {
                  imageFile = await picker.pickImage(
                    source: ImageSource.camera,
                  );
                  setState(() {});
                },
                child: const Text("Select"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
