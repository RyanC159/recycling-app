import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraTest extends StatefulWidget {
  @override
  _CameraTestState createState() => _CameraTestState();
}

class _CameraTestState extends State<CameraTest> {
  late CameraController _controller;
  late List<CameraDescription> _cameras;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(_cameras[0], ResolutionPreset.medium);

    await _controller.initialize();

    if (!mounted) return;

    setState(() {
      _isCameraInitialized = true;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isCameraInitialized) {
      return Container();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Test'),
      ),
      body: CameraPreview(_controller),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: () {
          takePicture();
        },
      ),
    );
  }

  void takePicture() async {
    if (!_controller.value.isInitialized) {
      return;
    }

    final image = await _controller.takePicture();

    // Process the captured image for classification
    // ...

    // Display the captured image
    // showDialog(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //     title: Text('Captured Image'),
    //     content: Image.file(File(image.path)),
    //     actions: [
    //       FlatButton(
    //         child: Text('OK'),
    //         onPressed: () {
    //           Navigator.of(context).pop();
    //         },
    //       ),
    //     ],
    //   ),
    // );
  }
}
