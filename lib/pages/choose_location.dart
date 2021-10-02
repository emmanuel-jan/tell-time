import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({ Key? key }) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'flag1.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'flag1.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'flag1.png'),
    WorldTime(url: 'Africa/Kampala', location: 'Uganda', flag: 'flag1.png'),
    WorldTime(url: 'Africa/Johannesburg', location: 'South Africa', flag: 'flag1.png'),
    WorldTime(url: 'Africa/Lagos', location: 'Nigeria', flag: 'flag1.png'),
    WorldTime(url: 'Africa/Tunis', location: 'Tunisia', flag: 'flag1.png'),    
    WorldTime(url: 'Africa/Maputo', location: 'Mozambique', flag: 'flag1.png'),
    WorldTime(url: 'Africa/Khartoum', location: 'Sudan', flag: 'flag1.png'),
    WorldTime(url: 'Africa/Juba', location: 'South Sudan', flag: 'flag1.png'),
    WorldTime(url: 'Africa/Ndjamena', location: 'Chad', flag: 'flag1.png'),
    WorldTime(url: 'Africa/Abidjan', location: 'Cote d\'Ivorie', flag: 'flag1.png'),
    WorldTime(url: 'Africa/Accra', location: 'Ghana', flag: 'flag1.png'),
    WorldTime(url: 'Africa/Algiers', location: 'Algeria', flag: 'flag1.png'),
    WorldTime(url: 'Africa/Casablanca', location: 'Morocco', flag: 'flag1.png'),

//     "Africa/Abidjan",
// "Africa/Accra",
// "Africa/Algiers",
// "Africa/Bissau",
// "Africa/Cairo",
// "Africa/Casablanca",
// "Africa/Ceuta",
// "Africa/El_Aaiun",
// "Africa/Johannesburg",
// "Africa/Juba",
// "Africa/Khartoum",
// "Africa/Lagos",
// "Africa/Maputo",
// "Africa/Monrovia",
// "Africa/Nairobi",
// "Africa/Ndjamena",
// "Africa/Sao_Tome",
// "Africa/Tripoli",
// "Africa/Tunis",
// "Africa/Windhoek",
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    Navigator.pushNamed(context, '/loader');
    await instance.getTime();
    //navigate to home screen
    Navigator.pushReplacementNamed(context,'/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
        ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  // Navigator.pushNamed(context, '/loader');
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}