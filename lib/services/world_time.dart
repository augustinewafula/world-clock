import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class WorldTime{
  String location; //location name for the ui
  String time; //the time in that location
  String flag; //url to an asset flag icon
  String url; //location api for url endpoint

  WorldTime({ this.location, this.flag, this.url });

  Future<void> getTime() async {
    try {
      var response = await http.get("http://worldtimeapi.org/api/timezone/$url");
      Map data = convert.jsonDecode(response.body);
      //print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);
//    print(datetime);
//    print(offset);

      //create Datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set the time property
      time = now.toString();
    } catch (e) {
      time = "Could not load time";
    }

  }
}
