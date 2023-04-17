import 'package:flutter/material.dart';
import 'package:image_zoomer/image_zoomer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Image Zoomer'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Show Image Zoomer'),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => const ImageZoomer(
                          image:
                              "https://i.pinimg.com/550x/ae/de/a9/aedea9ea9db181dcbc0ad146c87d8842.jpg",
                          imageType: ImageType.network,
                        ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
