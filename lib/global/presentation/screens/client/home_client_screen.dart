import 'package:flutter/material.dart';

class HomeClientScreen extends StatefulWidget {
  final String name;
  const HomeClientScreen({super.key, required this.name});

  @override
  _HomeClientScreenState createState() => _HomeClientScreenState();

}

class _HomeClientScreenState extends State<HomeClientScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  closeState() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is the client screen',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}