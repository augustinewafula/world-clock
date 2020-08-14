import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:world_clock/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "Loading...";

  void setupWorldTime() async {
    WorldTime worldTime = WorldTime(location: "Nairobi", flag: "ke.png", url: "Africa/Nairobi");
    await worldTime.getTime();
    setState(() {
      time = worldTime.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Text(time),

      )
    );
  }
}
