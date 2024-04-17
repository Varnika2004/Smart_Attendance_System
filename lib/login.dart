import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'forgotpassword.dart';

import 'camera.dart';

import 'dart:math';

double radius = 999999999999999; //200meters  0.2

//center:
/*10.8275736
77.0605178*/

/*10.8275736
77.0605178*/

/*
10.8275432
77.0601695*/

/*
10.8275432
77.0601695*/

/*
10.8275432
77.0601695*/


//main gate:

/*10.8277837
77.0606286*/
/**/
/**/
/**/
/**/
/**/

double centerLocationLatitude=10.8275736;
double centerLocationLongitude=77.0605178;

double findDistance(double currentLatitude, double currentLongitude){
var lat1 = toRadian(centerLocationLatitude);
var lng1 = toRadian(centerLocationLongitude);
var lat2 = toRadian(currentLatitude);
var lng2 = toRadian(currentLongitude);

// Haversine Formula
var dlong = lng2 - lng1;
var dlat = lat2 - lat1;

var res = pow(sin((dlat / 2)), 2) + cos(lat1) * cos(lat2) * pow(sin(dlong / 2), 2);
res = 2 * asin(sqrt(res));
double R = 6371;
res = res * R;
return res;
}

double toRadian(double val){
  double one_deg = (pi) / 180;
  return (one_deg * val);
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    await Geolocator.openLocationSettings();
    return Future.error('Location services are disabled.');

  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
}


class Login extends StatefulWidget {
  const Login() : super();

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FocusNode ul = FocusNode();
  FocusNode pass = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 1),
          Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'SMARTONANCE',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: 'OleoScript',
                    fontSize: 40,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  )
              ),

              SizedBox(height: 10,),

              Container(
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                //backgroundColor: Colors.grey.shade600,
                child: TextFormField(
                  autofocus: true,
                  //focusNode: ul,

                  decoration: InputDecoration(
                    labelText: 'User name',
                    labelStyle: TextStyle(
                      color: Colors.white54,
                    ),
                    fillColor: Colors.grey.shade50,
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Container(
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: TextFormField(
                  autofocus: true,
                  focusNode: pass,
                  obscureText: true,
                  enableIMEPersonalizedLearning: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.white54,
                    ),
                    fillColor: Colors.grey.shade800,
                  ),
                ),
              ),

              SizedBox(height: 20),

              Container(
                width: 300,
                height: 50,
                child: ElevatedButton(
                    onPressed: () async {
                      
                      Position location = await _determinePosition() ;
                      if(findDistance(location.latitude, location.longitude) < radius){
                        WidgetsFlutterBinding.ensureInitialized();
                        //final cameras = await availableCameras();
                        //final firstCamera = cameras.first;
                        await availableCameras().then(
                            (cameras) => Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (context) => TakePictureScreen(camera: cameras[1]))
                            )
                        );

                      }
                      else{
                        showDialog(context: context, builder: (context)=>AlertDialog(
                          backgroundColor: Colors.grey.shade800,
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          ),
                          title: Text(
                            'Try again later!',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: Text(
                                      'You must be inside the college campus to post your attendance',
                                       style: TextStyle(
                                         color: Colors.white,
                                       )
                                  ),
                          actions: [
                            ElevatedButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                }, child: Text(
                                      'OK',
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                 style: ElevatedButton.styleFrom(
                                   primary: Colors.grey.shade800,
                                 ),

                            )
                          ],
                        ));
                        print('hai');
                      }
                    },

                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(

                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    )
                ),
              ),

              //SizedBod(height: 10),
              SizedBox(height: 10),
              Container(
                height: 30,
                width: 302,
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                       },
                    child: Text(
                      'Forgot Password ?',
                      style: TextStyle(
                        fontSize: 11,
                      )
                    )
                  ),
                )
              )
            ],
          ),
            SizedBox(height: 60),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade900,
    );
  }
}
