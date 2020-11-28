import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data;

    //setting background img
    String bgImg = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/$bgImg'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 140.0, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'isDayTime': result['isDayTime'],
                          'location': result['location'],
                          'Flag' : result['flag']
                        };
                      });
                    },
                    icon: Icon(Icons.edit_location),
                    label: Text('Eidt Location')),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['time'],
                      style: TextStyle(
                        fontSize: 66.0,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )));
  } //build
} //class
