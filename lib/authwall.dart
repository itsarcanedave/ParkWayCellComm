import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parkway/auth.dart';
import 'package:parkway/pin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AuthWall());
}

// ignore: camel_case_types
class AuthWall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ParkWay',
      theme: new ThemeData(
        fontFamily: 'Raleway',
        primaryColor: Colors.blueAccent,
        accentColor: Colors.white,
      ),
      home: new WallBarrierScreen(),
    );
  }
}

class WallBarrierScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    return new WillPopScope(
      onWillPop: () => showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
          title: Text('Warning'),
          content: Text('Do you really want to exit'),
          actions: [
            FlatButton(
              child: Text('Yes'),
              onPressed: () => Navigator.pop(c, true),
            ),
            FlatButton(
              child: Text('No'),
              onPressed: () => Navigator.pop(c, false),
            ),
          ],
        ),
      ),
      child: new Stack(
        children: <Widget>[
          //Image.asset(
            //"assets/landing2.png",
            //height: MediaQuery.of(context).size.height,
            //width: MediaQuery.of(context).size.width,
            //fit: BoxFit.cover,
          //),
          Scaffold(
            backgroundColor: Colors.blueAccent,
            appBar: new AppBar(
              title: new Text("ParkWay"),
            ),
            body: new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                 new Text(
                   'Welcome to ParkWay!',
                   style: TextStyle(fontSize: 30, fontFamily: 'Raleway', color: Colors.white),
                     textAlign: TextAlign.center
                 ),
              new Padding(
                padding: const EdgeInsets.all(20.0),
              ),
                  new Text(
                      'Please choose an\nauthentication method to continue!',
                      style: TextStyle(fontSize: 20, fontFamily: 'Raleway', color: Colors.white),
                      textAlign: TextAlign.center
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(20.0),
                  ),
                  new RaisedButton.icon(
                    onPressed: () {
                      //if(user != null){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Auth()),
                        // MaterialPageRoute(builder: (context) => Test()),
                      );
                      // }

                      //Timer(Duration(seconds: 5), () =>
                      //);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    label: Text(
                      'AUTHENTICATE WITH FINGERPRINT',
                      style: TextStyle(color: Colors.blue),
                    ),
                    icon: Icon(
                      Icons.fingerprint_rounded,
                      color: Colors.blue,
                    ),
                    textColor: Colors.black,
                    splashColor: Colors.blue,
                    color: Colors.white,
                  ),
                  new RaisedButton.icon(
                    onPressed: () {
                      //if(user != null){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Pin()),
                        // MaterialPageRoute(builder: (context) => Test()),
                      );
                      // }

                      //Timer(Duration(seconds: 5), () =>
                      //);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    label: Text(
                      'AUTHENTICATE WITH PIN',
                      style: TextStyle(color: Colors.blue),
                    ),
                    icon: Icon(
                      Icons.app_registration,
                      color: Colors.blue,
                    ),
                    textColor: Colors.black,
                    splashColor: Colors.blue,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
