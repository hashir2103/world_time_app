import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for UI
  String time; //the time in that location
  String flag; //url to an assets flag icon
  String url; //location url for api endpoint
  bool isDayTime; //if daytime then day image else night image

  WorldTime({this.flag, this.location, this.url});

  Future<void> gettime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');

      Map data = jsonDecode(response.body);
      
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime = now.hour > 6 && now.hour < 19 ? true : false;

      time = DateFormat.jm().format(now);
    } catch (e) {
        print('Caught error : $e');
        time = 'Could not find time';
    }
  }
}
