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
  Future<void> _picktime() async{
    print("hello");
    final time=  await showTimePicker(context: context, initialTime: TimeOfDay.now());
     if(time!= null){

       setState(() {
         selectedTime =time;

       });

       FlutterAlarmClock.createAlarm(hour: time.hour,
       minutes: time.minute
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
            Container(
              margin: const EdgeInsets.all(25),
              child: TextButton(
                child:  Text(
                  'Create alarm at 23:59',
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
