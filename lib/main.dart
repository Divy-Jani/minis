import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttermini/landing.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        fontFamily: GoogleFonts.poppins().fontFamily,// Initialize Poppins font
          primaryTextTheme: GoogleFonts.latoTextTheme()
      ),
      home: const HomePage(),

    );
  }
}



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  Future<FirebaseApp> _initializeFirebase() async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(


        body: FutureBuilder(
            future: _initializeFirebase(),
            builder: (context,snapshot){
              if(snapshot.connectionState==ConnectionState.done){
                return LoginScreen();
              }

              return const Center (
                child : CircularProgressIndicator(),
              );
            },

            ),
    );
  }
}


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  static Future<User?> loginn ({ required String email, required String password , required BuildContext context }) async {

  FirebaseAuth auth= FirebaseAuth.instance;
  User? user;
  try {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
    user = userCredential.user;

  } on FirebaseAuthException catch  (e){

    if(e.code== "user-not-found"){
      print("No User Found for that email");
  }
  }
  return user;
  }











  @override
  Widget build(BuildContext context) {

   TextEditingController _emailControllerr =TextEditingController();

   TextEditingController _passwrodcontroller =TextEditingController();
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,



          children:  [

             SizedBox(
              height: 150,
            ),
            Align(

              alignment: Alignment.center,
              child: Text( "Minis" ,

               style: TextStyle(
                 fontSize: 55,
                 color: Colors.lightGreen,
                 fontWeight: FontWeight.bold,

               ),
              ),
            ),




              Text( "Login ",
              style: TextStyle(
                  color: Colors.blueGrey , fontSize: 30
              ),
            ),




              Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(

              controller: _emailControllerr,
                keyboardType: TextInputType. emailAddress,
                decoration: InputDecoration(
                  hintText: "User Email",
                  prefixIcon: Icon (Icons. mail, color: Colors.lightGreen ,
                  ) , // InputDecoration
                ),
            ),
          ),

               SizedBox(
                height: 15.0,
              ),



              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  controller: _passwrodcontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "User Password" ,
                        prefixIcon: Icon (Icons. security, color: Colors.lightGreen, ) , // InputDecoration

                    ),

                    // TextFie1d

        ),
              ) , // Text




            SizedBox(
              height: 15.0,
            ),





















        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Container(
              width: double. infinity,
              child: RawMaterialButton(

                fillColor: Colors.green,
                  elevation: 0.0,
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(70.0)),
          onPressed: ( ) async {
                  User? user =await loginn(email: _emailControllerr.text, password: _passwrodcontroller.text , context: context);

            print(user);

                  if(user != null ){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> LandingPage()));
                  }







          } ,
          child : Text(
            'Login', style: TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold
          ),
          ),
// RoundedRectang1eBorder

// TextSty1e // Text
    ) , // RawMateria1Button
    ),
        ) , // Container





          ],
        ),
      ),


    );


  }
}
