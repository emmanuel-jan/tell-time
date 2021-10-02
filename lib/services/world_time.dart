import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location; //location name for the UI
  late String time; //the time in that loaction
  String flag; //a url to an asset flag icon
  String url; //loaction url for api endpoint
  late bool isDaytime; //true or false if daytime or not


    WorldTime({required this.location, required this.flag, required this.url});

    Future<void> getTime() async {

      try{
        //make the request
        Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
        Map data = jsonDecode(response.body);
        //print(data);

        //Get properties from data
        String datetime = data['datetime'];
        String offset = data['utc_offset'].substring(1,3);
        // print(datetime);
        // print(offset);

        //Create a datetime object
        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(offset)));

        //set the time property
        isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
        time = DateFormat.jm().format(now);
      }catch(e){
        print('Caught error $e');
        time = 'Could not update time data';
      }

 
  }


}