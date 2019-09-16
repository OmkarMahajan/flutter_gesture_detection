import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart' as prefix0;
import 'home.dart';
import 'second.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
  runApp(new MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage()

    );

  }
}


class LoginPage extends StatelessWidget {
  FocusNode myFocusNode;
  String password = "";
  String username = "";
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);



  int verify(String user,String pass)
  {
          if(user == "omkar")
            {
              if(pass == "1234")
                {
                  return 1;
                }
            }
          return 0;
  }

  @override
  Widget build(BuildContext context) {

    final emailField = TextField(
      obscureText: false,
      keyboardType: TextInputType.emailAddress,
      style: style,
      onChanged: (text1)
      {
        username = text1;
      },
      focusNode: myFocusNode,
      decoration: InputDecoration(
          labelText: "UserName",
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      obscureText: true,
      style: style,
      onChanged: (text) {
        password = text;
      },
      decoration: InputDecoration(
        labelText: "Password",
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: ()
        {
          if(verify(username,password) == 1)
            {
              Navigator.push(context, MaterialPageRoute(builder:
              (context) => HomePage(cameras),

                ),
              );
            }
          else {

          }
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),

    );



    return Scaffold(
      appBar: AppBar(
        title: Text('Home', textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child : Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 75.0,
                child: Image.asset(
                  "images/Logo1.jfif",
                  fit: BoxFit.contain,
                ),
              ),

              SizedBox(height: 30.0),
              emailField,
              SizedBox(height: 15.0),
              passwordField,
              SizedBox(
                height: 35.0,
              ),
              loginButon,

              SizedBox(
                height: 15.0,
              ),


            ],
          ),
        ),
      ),

    );
  }


}






//Navigator.push(context, MaterialPageRoute(builder: (context) => ShowCase())
//class ShowCase extends StatelessWidget {
  //@override
  //Widget build(BuildContext context) {
    //return MaterialApp(
      //title: 'tflite real-time detection',
      //theme: ThemeData(
        //brightness: Brightness.dark,
      //),
      //body: new HomePage(cameras),


    //);
  //}
//}

//RaisedButton(
//child: const Text("Hi"),
//onPressed: () {
//Navigator.push(context, MaterialPageRoute(

//builder: (context) => A(),
//),
//);
//},
//),



