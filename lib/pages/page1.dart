import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final List<Continent> continents = [
    Continent(
      name: 'Africa',
      description: 'A diverse continent with rich culture and wildlife.',
    ),
    Continent(
      name: 'Asia',
      description: 'The largest and most populous continent.',
    ),
    Continent(
      name: 'Europe',
      description: 'Known for its history, art, and diverse cultures.',
    ),
    Continent(
      name: 'Antartica',
      description: 'Antarctica is the southernmost continent on Earth and is located almost entirely within the Antarctic Circle.',
    ),Continent(
      name: 'North America',
      description: 'North America is the third-largest continent, located in the Northern Hemisphere and almost entirely within the Western Hemisphere. ',
    ),
    Continent(
      name: 'South America',
      description: 'South America is the fourth-largest continent, situated in the Southern Hemisphere and mainly within the Western Hemisphere. ',
    ),
    Continent(
      name: 'Australia',
      description: 'Australia, often referred to as the continent of Australia or Oceania, is the smallest and flattest of the continents',
    ),
    // Add more continents as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Continents'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(), // This ensures the Container takes up the full height
        child: ListView.builder(
          itemCount: continents.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(continents[index].name,style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContinentDetailPage(continents[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class Continent {
  String name;
  String description;

  Continent({required this.name, required this.description});
}

class ContinentDetailPage extends StatelessWidget {
  final Continent continent;

  ContinentDetailPage(this.continent);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(continent.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(continent.description),
          ],
        ),
      ),
    );
  }
}

