import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Authentication/google_authenticatoin.dart';
import 'mainScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              SizedBox(height: 10),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // default color for 'Login or '
                    ),
                    children: [
                      TextSpan(
                        text: 'Login or ',
                        style: TextStyle(
                          color:  Colors.blue,
                        ),
                      ),
                      TextSpan(
                        text: 'Signup',
                        style: TextStyle(
                          color: Colors.black,
                        ), // color for 'Signup'
                      ),
                    ],
                  ),
                ),
              ),
              Divider(color: Colors.black12),
              Padding(
                padding: EdgeInsets.all(16),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome to POS-AR",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      phoneNumberField(size: size),
                      SizedBox(height: 10,),
                      RichText(
                        text: TextSpan(
                          text:
                          "We'll call or text you to confirm your number. Standard message and data rates may apply",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      Container(
                        width: size.width,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => HomeScreen()),
                              );
                            },
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 0.026),
                      Row(
                        children: [
                          Expanded(
                            child: Container(height: 1, color: Colors.black26),
                          ),
                          Padding(padding:EdgeInsets.symmetric(horizontal:20),
                          child:Text("or",
                          style:TextStyle(fontSize:18))),
                          Expanded(child:Container(
                            height:1,
                            color:Colors.black26
                          ))

                        ],
                      ),
                      SizedBox(height:size.height*0.015),
                      socialButton(size,
                      Icons.facebook,
                      "Continue with Facebook",
                      Colors.blue,
                      30),
                      InkWell(
                        onTap:() async{
                          // await FirebaseAuthServices.signInWithGoogle();
                          // Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>HomeScreen()));
                        },
                        child: socialButton(size,
                            FontAwesomeIcons.google,
                            "Continue with Facebook",
                            Colors.redAccent,
                            30),
                      ),
                      socialButton(size,
                          FontAwesomeIcons.apple,
                          "Continue with Facebook",
                          Colors.black,
                          30),
                      const SizedBox(height:10),
                      const Center(
                        child:Text(
                          "Need Help?",
                          style:TextStyle(
                            fontWeight:FontWeight.bold,
                            fontSize:17,
                          )
                        )
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding socialButton(Size size,icon,name,color,double iconSize) {
    return Padding(
                      padding:EdgeInsets.only(bottom:15),
                      child:Container(width:size.width,
                      padding:EdgeInsets.symmetric(vertical:11),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border:Border.all(),
                      ),
                        child:Row(children:[SizedBox(width:size.width*0.05),
                        Icon(icon,color:color,size:iconSize),
                        SizedBox(width:size.width*0.18),
                        Text(name,style:TextStyle(fontSize:18,fontWeight:FontWeight.w500)),
                        SizedBox(width:10)])
                      ),
                    );
  }
}

class phoneNumberField extends StatelessWidget {
  const phoneNumberField({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
       width: size.width,
       height: size.height*0.14,
       decoration: BoxDecoration(
         border: Border.all(color: Colors.black45),
         borderRadius: BorderRadius.circular(15),
       ),
       child: Column(
         children: [
           Padding(
             padding: EdgeInsets.only(
               right: 10,
               left: 10,
               top: 8,
             ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   "Country/Region",
                   style: TextStyle(color: Colors.black45),
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text(
                       "India(+91)",
                       style: TextStyle(
                         color: Colors.black,
                         fontSize: 12,
                       ),
                     ),
                     Icon(
                       Icons.keyboard_arrow_down_sharp,
                       size: 15,
                     ),
                   ],
                 ),
               ],
             ),
           ),
           Divider(),
           Padding(padding:EdgeInsets.symmetric(horizontal:10),
           child:TextField(decoration:InputDecoration(
             hintText:"Phone Number",
             hintStyle:TextStyle(
               fontSize:12,
               color:Colors.black45,
             ),
             border:InputBorder.none
           ))),
         ],
       ),
     );
  }
}
