import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  DateTime date=DateTime(2022,12,23);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hi"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          children: [
                Text(
                  "${date.day}/${date.month}/${date.year}",
                  style: TextStyle(fontSize: 32),
                ),
            const SizedBox(height: 15,),
            ElevatedButton(
                child: Text("Calender"),
              onPressed: () async{
              DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
              );
              if(newDate==null) return;
              setState(() {
                date=newDate;
              });

            },
            ),
          ],
        ),
      ),
    );
  }
}
