import 'package:flutter/material.dart';
import 'package:flutter_assisment/screen/booking_screen.dart';
import 'package:flutter_assisment/screen/home_screen.dart';
import 'package:flutter_assisment/screen/profile_screen.dart';

class LandingScreen extends StatefulWidget {
  static const String id = 'landing_screen';

  const LandingScreen({Key key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final List<Widget> _pages = [
    const HomeScreen(),
    const ProfileScreen(),
    const BookingScreen(),
  ];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              '${"Retail shop"} ',
              overflow: TextOverflow.fade,
              // overflow: TextOverflow.clip,
              softWrap: false,
              maxLines: 1,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Center(
            child: IndexedStack(
                index: _selectedIndex,
                children: _pages) //_items.elementAt(_index),
            ),
        bottomNavigationBar: _showBottomNav(),
      ),
    );
  }

  Widget _showBottomNav() {
    return BottomNavigationBar(
      elevation: 10,
      mouseCursor: SystemMouseCursors.grab,
      selectedFontSize: 20,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'Bookings',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.black54,
      onTap: _onTap,
    );
  }

  void _onTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }
}
