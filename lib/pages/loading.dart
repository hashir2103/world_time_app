import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setuptime() async {
    WorldTime t =
        WorldTime(location:'Karachi', flag:'pakistan.png', url: 'Asia/Karachi');

    await t.gettime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : t.location, 'flag': t.flag, 'time': t.time , 'isDayTime': t.isDayTime }
      );
  }

  @override
  void initState() {
    super.initState();
    setuptime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: SpinKitDualRing (
          color: Colors.white30,
          size: 90.0,
        ),
      ),
    );
  }
}
