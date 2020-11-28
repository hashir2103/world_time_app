import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Karachi', location: 'Karachi', flag: 'pakistan.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png')
  ];

  void updateTime(index) async {
    WorldTime t = locations[index];
    await t.gettime();
    Navigator.pop(context, {
      'location': t.location,
      'flag': t.flag,
      'time': t.time,
      'isDayTime': t.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: MyAppBar(),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 1.0, vertical: 5.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/${locations[index].flag}')),
                ),
              ),
            );
          },
        ));
  }
}

class MyAppBar extends AppBar {
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.red[900],
      title: Text('Choose a Location'),
      centerTitle: true,
    );
  }
}

class MyLocationList extends ListView{

  
}

