import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profile_screen';

  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Text(
          "Profile screen",
          style: Theme.of(context).textTheme.labelMedium.copyWith(
              fontSize: 16, color: Colors.black38, fontWeight: FontWeight.w600),
        ),
      ),
    ));
  }
}
