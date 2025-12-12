import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TimeOfDay? selectedTime;
  TextEditingController _title = TextEditingController();
  Future<void> _picktime() async{
    await TextField(
      controller: _title,
      decoration: InputDecoration(
        hintText: "heloo",
      ),

    );
    final time=  await showTimePicker(context: context, initialTime: TimeOfDay.now(), );
     if(time!= null){

       setState(() {
         selectedTime =time;

       });

       FlutterAlarmClock.createAlarm(hour: time.hour,
       minutes: time.minute,
         title: _title.text,
       );
     }



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,

        title: Text('Alarm App'),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          children: <Widget>[

          TextField(
          controller: _title,
          decoration: InputDecoration(
            labelText: 'Alarm Title',
            border: OutlineInputBorder(),
          ),),
            Container(
              margin: const EdgeInsets.all(25),
              child: TextButton(
                child:  Text(
                  'Create alarm ',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: _picktime,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(25),
              child: const TextButton(
                onPressed: FlutterAlarmClock.showAlarms,
                child: Text('Show alarms', style: TextStyle(fontSize: 20)),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(25),
              child: TextButton(
                child: const Text(
                  'Create timer for 42 seconds',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  FlutterAlarmClock.createTimer(length: 42);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(25),
              child: const TextButton(
                onPressed: FlutterAlarmClock.showTimers,
                child: Text('Show Timers', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
