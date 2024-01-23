import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          const pageName = ['Home', 'My Clients', 'Records'];
          const pageRoute = ['/', '/clients', '/records'];

          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, pageRoute[index]);
            },
            child: ListTile(
              title: Text(pageName[index]),
            ),
          );
        },
      ),
    );
  }
}
