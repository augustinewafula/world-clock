import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    print(data);

    //set background
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';

    return Scaffold(
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/$bgImage"),
                fit: BoxFit.cover
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, "/location");
                    },
                    icon: Icon(
                        Icons.edit_location,
                        color: Colors.white,
                    ),
                    label: Text(
                        "Edit Location",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          data['location'],
                          style: TextStyle(
                            fontSize: 28,
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                    data['time'],
                    style: TextStyle(
                        fontSize: 66,
                        color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
