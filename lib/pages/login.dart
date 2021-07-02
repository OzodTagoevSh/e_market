import 'package:e_market/pages/home.dart';
import 'package:e_market/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  SharedPreferences? preferences;
  bool isLoggedIn = false;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });

//    preferences = await SharedPreferences.getInstance();
//    isLoggedIn = await googleSignIn.isSignedIn();

    if (isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }

    setState(() {
      loading = false;
    });
  }

  // Future handleSignIn() async {
  //   setState(() {
  //     loading = true;
  //   });
  //   ///****************************** GOOGLE SIGN IN *****************************/
  // /*
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  //   GoogleSignInAuthentication googleSignInAuthentication =
  //       await googleUser!.authentication;
  //   AuthCredential credential = GoogleAuthProvider.credential(
  //       idToken: googleSignInAuthentication.idToken,
  //       accessToken: googleSignInAuthentication.accessToken);
  //   UserCredential authResult = await auth.signInWithCredential(credential);
  //   User? user = authResult.user;
  //   if (user != null) {
  //     final QuerySnapshot result = await FirebaseFirestore.instance
  //         .collection('users')
  //         .where('id', isEqualTo: user.uid)
  //         .get();
  //     final List<DocumentSnapshot> documents = result.docs;
  //
  //     if (documents.length == 0) {
  //       // Inserting the user to the collection
  //       FirebaseFirestore.instance.collection('users').doc(user.uid).set({
  //         'id': user.uid,
  //         'username': user.displayName,
  //         'profilePicture': user.photoURL,
  //       });
  //
  //       await preferences!.setString('id', user.uid);
  //       await preferences!.setString('username', user.displayName.toString());
  //       await preferences!.setString('profilePicture', user.photoURL.toString());
  //     } else {
  //         await preferences!.setString('id', documents[0]['id']);
  //         await preferences!.setString('username', documents[0]['username']);
  //         await preferences!.setString('profilePicture', documents[0]['profilePicture']);
  //     }
  //
  //     Fluttertoast.showToast(msg: 'Login was successful');
  //     setState(() {
  //       loading = false;
  //     });
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
  //   } else {
  //     Fluttertoast.showToast(msg: 'Login failed');
  //   }
  //
  //  */
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/back.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),

          Container(
            color: Colors.black.withOpacity(0.8),
            height: double.infinity,
            width: double.infinity,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(100, 100, 100, 0.0),
            child: Container(
              height: 75,
              width: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: Colors.green[200],
              ),
              child: Image.asset('images/logo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 250.0),
            child: Center(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.6),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0, right: 20.0),
                            child: TextFormField(
                              controller: _emailTextController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Email',
                                icon: Icon(Icons.alternate_email_outlined),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  Pattern pattern =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  RegExp regex = RegExp(pattern.toString());
                                  if (!regex.hasMatch(value))
                                    return 'Please make sure to enter valid email address';
                                  else
                                    return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.6),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0, right: 20.0),
                            child: TextFormField(
                              controller: _passwordTextController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Password',
                                icon: Icon(Icons.lock_outlined),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'The password should not be empty';
                                } else if(value.length < 6) {
                                    return 'Please enter the password which has minimum length of 6';
                                } else
                                  return null;
                              },
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.red.shade700,
                          elevation: 0.0,
                          child: MaterialButton(
                            onPressed: () {

                            },
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                              'Login',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),

                      Padding(padding: EdgeInsets.all(8.0),
                        child: Text('Forgot password',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                          },
                          child: Text('Sign up!', textAlign: TextAlign.center, style: TextStyle(color: Colors.red, fontSize: 20.0),),
                        ),
                      ),

                     ///************************ GOOGLE SIGN IN ******************************/
                     /*
                     Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.red,
                          elevation: 0.0,
                          child: MaterialButton(
                            onPressed: () {
                              handleSignIn();
                            },
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                              'Google',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      */
                    ],
                  ),
                ),
              ),
          ),
          Visibility(
            visible: loading == true ? true : false,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.9),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


