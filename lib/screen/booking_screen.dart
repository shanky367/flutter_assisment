import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  static const String id = 'booking_screen';

  const BookingScreen({Key key}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Text(
          "Bookings screen",
          style: Theme.of(context).textTheme.labelMedium.copyWith(
              fontSize: 16, color: Colors.black38, fontWeight: FontWeight.w600),
        ),
      ),
    ));
  }
}
