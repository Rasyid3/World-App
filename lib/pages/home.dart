import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    //print(data);
    String bgImage = data['isDay'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDay'] ? Colors.blue : Colors.deepPurple;

    return Scaffold(
        appBar: AppBar(
          title: Text('World Time'),
          centerTitle: true,
          backgroundColor: bgColor,
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.location_on_rounded,
                      color: Colors.cyanAccent, size: 24),
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                  label: Text('Change Location'),
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'flag': result['flag'],
                        'isDay': result['isDay'],
                      };
                    });
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['location']!,
                        style: TextStyle(
                            fontSize: 30,
                            letterSpacing: 2,
                            color: Colors.white)),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  data['time'],
                  style: TextStyle(fontSize: 60, color: Colors.white),
                )
              ],
            ),
          ),
        ));
  }
}
