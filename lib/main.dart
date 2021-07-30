// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   String greetings = '';
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: Text('FF- Recon'),
//           ),
//           body: Center(child: Column(children: <Widget>[
//
//             Container(
//               margin: EdgeInsets.all(25),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(elevation: 2),
//                 onPressed: () { },
//                 child: Text('Subdomain Finder'),
//               )
//             ),
//             Container(
//               margin: EdgeInsets.all(25),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(elevation: 2),
//                 onPressed: () { },
//                 child: Text('Port Scan'),
//               )
//             ),
//             Container(
//               margin: EdgeInsets.all(25),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(elevation: 2),
//                 onPressed: () { },
//                 child: Text('Directory Bruteforce'),
//               )
//             ),
//             Container(
//               margin: EdgeInsets.all(25),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(elevation: 2),
//                 onPressed: () async {
//
//                     final response = await http.get(Uri.parse('http://10.0.2.2:5000/')); //getting the response from our backend server script
//
//                     final decoded = json.decode(response.body) as Map<String, dynamic>; //converting it from json to key value pair
//
//                     setState(() {
//                       greetings = decoded['greetings']; //changing the state of our widget on data update
//                     });
//
//                   },
//                   child: Text(
//                     'Press',
//                     style: TextStyle(fontSize: 24,),
//               )
//             ),
//             )
//          ]
//           ))
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Get Request',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String greetings = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(greetings, //Text that will be displayed on the screen
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Center(
              child: Container( //container that contains the button
                width: 150,
                height: 60,
                child: FlatButton(
                  color: Colors.blue,
                  onPressed: () async { //async function to perform http get

                    final response = await http.get(Uri.parse('http://10.0.2.2:5000/sub')); //getting the response from our backend server script

                    final decoded = json.decode(response.body) as Map<String, dynamic>; //converting it from json to key value pair

                    setState(() {
                      greetings = decoded['result']; //changing the state of our widget on data update
                    });

                  },
                  child: Text(
                    'Press',
                    style: TextStyle(fontSize: 24,),
                  ),
                ),
              ),
            ),
            Center(
              child: Container( //container that contains the button
                width: 150,
                height: 60,
                child: FlatButton(
                  color: Colors.blue,
                  onPressed: () async { //async function to perform http get

                    final response = await http.get(Uri.parse('http://10.0.2.2:5000/port')); //getting the response from our backend server script

                    final decoded = json.decode(response.body) as Map<String, dynamic>; //converting it from json to key value pair

                    setState(() {
                      greetings = decoded['result']; //changing the state of our widget on data update
                    });

                  },
                  child: Text(
                    'Press',
                    style: TextStyle(fontSize: 24,),
                  ),
                ),
              ),
            ),
            Center(
              child: Container( //container that contains the button
                width: 150,
                height: 60,
                child: FlatButton(
                  color: Colors.blue,
                  onPressed: () async { //async function to perform http get

                    final response = await http.get(Uri.parse('http://10.0.2.2:5000/dir')); //getting the response from our backend server script

                    final decoded = json.decode(response.body) as Map<String, dynamic>; //converting it from json to key value pair

                    setState(() {
                      greetings = decoded['result']; //changing the state of our widget on data update
                    });

                  },
                  child: Text(
                    'Press',
                    style: TextStyle(fontSize: 24,),
                  ),
                ),
              ),
            ),
            Center(
              child: Container( //container that contains the button
                width: 150,
                height: 60,
                child: FlatButton(
                  color: Colors.blue,
                  onPressed: () async { //async function to perform http get

                    final response = await http.get(Uri.parse('http://10.0.2.2:5000/broken')); //getting the response from our backend server script

                    final decoded = json.decode(response.body) as Map<String, dynamic>; //converting it from json to key value pair

                    setState(() {
                      greetings = decoded['result']; //changing the state of our widget on data update
                    });

                  },
                  child: Text(
                    'Press',
                    style: TextStyle(fontSize: 24,),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}