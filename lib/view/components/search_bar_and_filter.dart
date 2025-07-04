import 'package:flutter/material.dart';
class SearchBarAndFilter extends StatelessWidget {
  const SearchBarAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(
        horizontal:25,
      ),
      child:Row(
        children: [
          Expanded(
            child:Container(decoration:BoxDecoration(
              color:Colors.white,
              borderRadius:BorderRadius.circular(30),
              boxShadow:const[
                BoxShadow(
                  blurRadius:1,
                  color:Colors.orangeAccent,
                )
              ]
            ),
            child:Padding(
              padding:EdgeInsets.symmetric(
                horizontal:10,
                vertical:10,
              ),
              child:Row(
                children:[
                  Icon(Icons.search,
                  size:32,
                  ),
                  SizedBox(width:9),
                  Column(
                    crossAxisAlignment:CrossAxisAlignment.start,children: [
                    Text("  Where to?",
                    style:TextStyle(
                      fontSize:16,
                      fontWeight:FontWeight.w500,
                    ),),
                    SizedBox(
                      height:20,
                      width:240,
                      child:TextField(
                        decoration:InputDecoration(
                          border:OutlineInputBorder(
                            borderSide:BorderSide.none,
                          ),
                          hintText:"Anywhere . Any Week . Add Guests",
                          hintStyle:TextStyle(
                            color:Colors.black,
                            fontSize:10
                          ),
                          filled:true,
                          fillColor:Colors.white,
                        )
                      )
                    )
                  ],)
                ]
              )
            ))
          ),
          SizedBox(width:8),
          Container(

            padding:EdgeInsets.all(10),
            decoration:BoxDecoration(
              color: Colors.white,

              shape:BoxShape.circle,
                boxShadow:const[
                  BoxShadow(
                    blurRadius:1,
                    color:Colors.orangeAccent,
                  )
                ]
            ),
            child:const Icon(Icons.tune,
            size:30)
          )
        ],
      )
    );
  }
}
