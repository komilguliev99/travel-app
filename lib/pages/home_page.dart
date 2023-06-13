import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/widgets/destination_carousel.dart';
import 'package:travel_ui/widgets/hotel_carousel.dart';
import 'package:travel_ui/widgets/icon_buttons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: const [
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.0, right: 120),
            child: Text(
              'What you would like to find?',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          IconButtons(),
          SizedBox(
            height: 20,
          ),
          DestinationCarousel(),
          SizedBox(
            height: 20,
          ),
          HotelCarousel()
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currTab,
        selectedLabelStyle: const TextStyle(fontSize: 0),
        unselectedLabelStyle: const TextStyle(fontSize: 0),
        onTap: (value) {
          setState(() {
            _currTab = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_pizza,
                size: 30,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage('assets/images/avatar.jpeg')),
              label: '')
        ],
      ),
    );
  }
}
