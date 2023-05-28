import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'notification_service.dart';

void main() {
  //init
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Layout Notif",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Local Notification"),),
        body: Center(
          child: ElevatedButton(
            child: const Text('Show notifications'),
            onPressed: () {
              NotificationService()
                  .showNotification(title: 'Sample title', body: 'It works!');
            },
          ),
        )
    );
  }
}