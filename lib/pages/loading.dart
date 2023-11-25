import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  int counter = 0;
  String time = 'Loading ...';

  void getData() async {
    Response response =
    await post(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    Map data = jsonDecode(response.body);
    print(data);
    print(data['title']);

    Future.delayed(Duration(seconds: 3), () {
      print('aSync Delayed Statement invoked');
    });

    String statement = await Future.delayed(Duration(seconds: 2), () {
      return 'sync Delayed Statement invoked';
    });

    print('$statement');
  }

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/nav', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDay': instance.isDay,
    });
    //print(instance.time);
    setState(() {
      time = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
    //getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Colors.blue[900],
        appBar: AppBar(
          title: Text('Loading'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: SpinKitCubeGrid(
            color: Colors.white,
            size: 50.0,
          ),
/*          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      setupWorldTime();
                      //counter += 1;
                      //getData();
                    });
                  },
                  child: Text('Click to get time')),
              TextButton(onPressed: () {}, child: Text('Berlin: $time'),),
            ],
          )*/
        ));
  }
}
