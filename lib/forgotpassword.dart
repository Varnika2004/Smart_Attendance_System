import 'package:flutter/material.dart';

/*class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    "SMARTONANCE",
                    style: TextStyle(
                        fontFamily: 'OleoScript',
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 75,
                ),

                Text(
                  "Reset Password",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 20,
                ),
                // Text(
                //   "Change your Password",
                //   style: TextStyle(
                //     color: Colors.teal,
                //     fontSize: 15,
                //   ).copyWith(fontWeight: FontWeight.w600),
                // ),

                //
                SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: "New Password",
                      labelStyle:
                          TextStyle(fontSize: 15, color: Colors.grey.shade400),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Confirm Password",
                      labelStyle:
                          TextStyle(fontSize: 15, color: Colors.grey.shade400),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 5,
                ),
                //
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: size.height / 14,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "Reset Password",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/


class LoginScreen extends StatefulWidget {
  const LoginScreen() : super();

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
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
                      labelText: 'New Password',
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
                      labelText: 'Confirm Password',
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
                      },

                      child: Text(
                        'Reset Password',
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

