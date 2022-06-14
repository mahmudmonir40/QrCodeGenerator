import 'package:flutter/material.dart';
import 'package:qr_code_generator/app_style/style.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,

      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String data = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.primaryColor,
      
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        title: Column(
          children: [
            Row(
              children: [
                Text("Qr Code Generator",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w100,fontFamily: "Translator"),),
              ],
            ),

            SizedBox(height: 0.0,),
            Row(
              children: [
                Text("Generate your QR Code .",style: TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.w400),),
              ],
            ),
          ],
        ),


        actions: [
          Container(
            height: 40,
            width: 50,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(300),
              image: DecorationImage(image: AssetImage("assets/images/torab.jpg"),fit: BoxFit.cover),
            ),
          ),

          SizedBox(width: 15,),
        ],


      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Center(
            child: QrImage(
              data: data,
              backgroundColor: Colors.white,
              size: 300.0,
              version: QrVersions.auto,
            ),

          ),

          SizedBox(height: 24.0,),
          Container(
            width: 300.0,

              child: TextField(
                //we will generate a new qr code when the input value change
                onChanged: (value){
                  setState(() {
                    data = value;
                  });
                },

                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),

                decoration: InputDecoration(
                  hintText: "Type the data",
                  filled: true,
                  fillColor: AppStyle.textInputColor,
                  border: InputBorder.none,
                ),
              ),
          ),


          // SizedBox(height: 24.0,),
          // RawMaterialButton(
          //     onPressed: (){},
          //   fillColor: AppStyle.accentColor,
          //   shape: StadiumBorder(),
          //   padding: EdgeInsets.symmetric(horizontal: 36.0,vertical: 16.0),
          //
          //   child: Text("Generate QR Code"),
          // )
        ],
      ),
    );
  }
}


