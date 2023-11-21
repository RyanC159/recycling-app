import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class RecyclingCamera extends StatefulWidget {
  @override
  _RecyclingCameraState createState() => _RecyclingCameraState();
}

class _RecyclingCameraState extends State<RecyclingCamera> {
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
    loadModel();
  }

  Future<void> initializeCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras[0], ResolutionPreset.medium);
    await _cameraController.initialize();
    setState(() {
      _isCameraInitialized = true;
    });
  }

  Future<void> loadModel() async {
    String modelPath = 'path_to_your_tflite_model';
    String labelsPath = 'path_to_your_labels_file';
    await Tflite.loadModel(
      model: modelPath,
      labels: labelsPath,
    );
  }

  Future<void> classifyImage(File image) async {
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
    );
    // Process the recognition results here
    print(recognitions);
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isCameraInitialized) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Recycling Camera'),
      ),
      body: CameraPreview(_cameraController),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            final image = await _cameraController.takePicture();
            classifyImage(File(image.path));
          } catch (e) {
            print(e);
          }
        },
        child: Icon(Icons.camera),
      ),
    );
  }
}
