import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  late String time;
  String flag;
  String url;
  late bool isDay;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print('The offset is $offset');
      // print('The datetime is $datetime');

      DateTime nowLondon = DateTime.parse(datetime);
      nowLondon = nowLondon.add(Duration(hours: int.parse(offset)));
      // print('The actual time in London is: $nowLondon');

      //time = nowLondon.toString();
      time = DateFormat.jm().format(nowLondon);
      isDay = nowLondon.hour > 6 && nowLondon.hour < 20 ? true : false;
      print (time);

    } catch (e) {
      print('Caught error: $e');
      time = 'Could not get time data';
    }
  }
}
