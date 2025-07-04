import 'package:flutter/material.dart';

class DisplayTotalPrice extends StatefulWidget {
  const DisplayTotalPrice({super.key});

  @override
  State<DisplayTotalPrice> createState() => _DisplayTotalPriceState();
}

class _DisplayTotalPriceState extends State<DisplayTotalPrice> {
  @override
  Widget build(BuildContext context) {
    bool isSwitch=true;
    return Padding(
      padding:EdgeInsets.symmetric(horizontal:20),
      child:Container(
        decoration:BoxDecoration(

          color:Colors.white,
          border:Border.all(
            color:Colors.black,
          ),

          borderRadius: BorderRadius.circular(20),
            // boxShadow:const[
            // BoxShadow(
            //   blurRadius:1,
            //   color:Colors.orangeAccent,
            // )
// ]
        ),
        child:Padding(
          padding:EdgeInsets.all(20),
          child:Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Display total price",
                  style:TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize:14,
                    ),
                  ),
                  Text(
                    "Include all fees, before taxes",
                    style:TextStyle(
                      color:Colors.black,
                        fontSize:13,
                    )
                  )
                ],
              ),
              Switch(
                inactiveThumbColor:Colors.white,
                inactiveTrackColor:Colors.black,
                activeColor:Colors.white,
                activeTrackColor: Colors.black,
                value:isSwitch,
                onChanged:(value) {
                  setState((){
                    isSwitch=value;
                  });
                }
              )],
          )
        )
      )
    );
  }
}
