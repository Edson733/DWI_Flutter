import 'package:flutter/material.dart';

import '../../widgets/card.dart';

class MenuAdminScreen extends StatelessWidget {
  final String title;
  const MenuAdminScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const CardWidget(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}