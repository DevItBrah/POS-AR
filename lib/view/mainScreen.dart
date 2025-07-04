import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'exploreScreen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;
  late final List<Widget>page;
  @override
  void initState(){
    page=[
      const ExploreScreen(),
      const Scaffold(),
      const Scaffold(),
      const Scaffold(),
      const Scaffold(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      bottomNavigationBar:BottomNavigationBar(
        backgroundColor:Colors.white,
        elevation: 5,
        iconSize:32,
        selectedItemColor:Colors.blueAccent,
        unselectedItemColor:Colors.black,
        selectedLabelStyle:TextStyle(fontWeight:FontWeight.bold),
        unselectedLabelStyle:TextStyle(fontWeight:FontWeight.bold),
        type:BottomNavigationBarType.fixed,
        currentIndex:selectedIndex,
        onTap:(index){
          setState(() {
            selectedIndex=index;
          });
        },
        items:[

          BottomNavigationBarItem(
            icon:Image.asset(
              'assets/icon/search.png',
              color:selectedIndex==0?Colors.blueAccent:Colors.black,
              height:30,

            ),
            label:"Explore"
          ),
          BottomNavigationBarItem(
            icon:Image.asset('assets/icon/favorite.png',height: 30,
              color:selectedIndex==1?Colors.blueAccent:Colors.black,),
            label:"Wishlist",

          ),
          BottomNavigationBarItem(
              icon:Image.asset('assets/icon/messenger.png',height: 30,
                color:selectedIndex==2?Colors.blueAccent:Colors.black,),
              label:"Message",

          ),

        ]
      ),
      body: page[selectedIndex],
    );
  }
}
