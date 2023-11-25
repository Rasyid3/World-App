import 'package:flutter/material.dart';

class VacationTheme {
  final String name;
  final String description;
  final List<String> countries;

  VacationTheme({
    required this.name,
    required this.description,
    required this.countries,
  });
}

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final List<VacationTheme> vacationThemes = [
    VacationTheme(
      name: 'Culinary Delights',
      description:
          'Explore countries known for their culinary excellence and diverse food offerings.',
      countries: ['Italy', 'France', 'Japan', 'Mexico'],
    ),
    VacationTheme(
      name: 'Romantic Getaways',
      description:
          'Highlight countries that are popular for romantic vacations, such as honeymoon destinations or charming cities.',
      countries: ['Maldives', 'Paris', 'Santorini', 'Bora Bora'],
    ),
    VacationTheme(
      name: 'Nature and Wildlife',
      description:
          'Showcase countries with rich biodiversity, national parks, and wildlife sanctuaries.',
      countries: ['Costa Rica', 'Kenya', 'Australia', 'Brazil'],
    ),
    VacationTheme(
      name: 'Urban Exploration',
      description:
          'Feature bustling cities known for their architecture, nightlife, and cultural attractions.',
      countries: ['New York', 'Tokyo', 'Paris', 'Dubai'],
    ),
    VacationTheme(
      name: 'Wellness Retreats',
      description:
          'Include countries with renowned spa resorts, wellness retreats, and natural healing environments.',
      countries: ['Thailand', 'Switzerland', 'Bali', 'India'],
    ),
    VacationTheme(
      name: 'Festivals and Events',
      description:
          'Explore countries famous for their vibrant festivals, cultural events, and celebrations.',
      countries: ['Brazil', 'India', 'Spain', 'Japan'],
    ),
    VacationTheme(
      name: 'Outdoor Adventures',
      description:
          'Highlight countries with opportunities for outdoor activities like hiking, skiing, and water sports.',
      countries: ['Canada', 'Switzerland', 'New Zealand', 'Norway'],
    ),
  ];

  void onThemePressed(VacationTheme theme) {
    // Navigate to the detailed page passing the selected theme
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VacationDetailPage(theme),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vacation Themes'),
      ),
      body: ListView.builder(
        itemCount: vacationThemes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(vacationThemes[index].name),
            onTap: () {
              onThemePressed(vacationThemes[index]);
            },
          );
        },
      ),
    );
  }
}

class VacationDetailPage extends StatelessWidget {
  final VacationTheme theme;

  VacationDetailPage(this.theme);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(theme.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description: ${theme.description}'),
            SizedBox(height: 16),
            Text('Countries with Good ${theme.name}:'),
            for (var country in theme.countries) Text('- $country'),
          ],
        ),
      ),
    );
  }
}
