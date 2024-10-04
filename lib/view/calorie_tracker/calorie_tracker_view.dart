import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CalorieTrackerView extends StatefulWidget {
  const CalorieTrackerView({super.key});

  @override
  State<CalorieTrackerView> createState() => _CalorieTrackerViewState();
}

class _CalorieTrackerViewState extends State<CalorieTrackerView> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  // Function to pick an image from camera or gallery
  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedImage = await _picker.pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calorie Tracker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the selected image
            _image != null
                ? Image.file(_image!)
                : const Text("No image selected"),
            const SizedBox(height: 20),
            // Buttons to pick an image
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.camera),
              child: const Text("Pick Image from Camera"),
            ),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.gallery),
              child: const Text("Pick Image from Gallery"),
            ),
          ],
        ),
      ),
    );
  }
}


