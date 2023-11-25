import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/person4.jpg'),
            ),
            SizedBox(height: 10),
            Text(
              'Nama: Rasyid Nafianto',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 5),
            Text(
              'NIM: 21120121140110',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 170),
            Text(
              'App Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Aplikasi about world dibuat untuk memenuhi TA PPB.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

