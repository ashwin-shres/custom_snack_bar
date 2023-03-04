import 'package:custom_snack_bar/snackbar_handler/snackbar_position.dart';
import 'package:custom_snack_bar/snackbar_handler/snackbar_style.dart';
import 'package:flutter/material.dart';

import 'snackbar_handler/snackbar_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Snackbar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Custom Snackbar Implementation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              minWidth: 150,
              height: 50,
              color: Colors.blue,
              onPressed: () {
                _onShowCustomSnackBar('Hello fellow coders');
              },
              child: const Text(
                "Press me",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              minWidth: 150,
              height: 50,
              color: Colors.red,
              onPressed: () {
                _onShowBottomSheetPressed();
              },
              child: const Text(
                "Show Bottom Sheet",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onShowSnackBar(String text) {
    var snackBar = SnackBar(
      content: Text(text),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _onShowCustomSnackBar(String text) {
    SnackbarHandler().showOverlay(context,
        text: text, style: SnackbarStyle.error, position: SnackbarPosition.top);
  }

  _onShowBottomSheetPressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Center(
              child: MaterialButton(
                minWidth: 150,
                height: 50,
                color: Colors.green,
                onPressed: () {
                  _onShowCustomSnackBar("Showing from bottom sheet");
                },
                child: const Text(
                  "Show Bottom Sheet",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        });
  }
}
