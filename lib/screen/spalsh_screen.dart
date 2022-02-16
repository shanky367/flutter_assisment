
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_assisment/screen/home_screen.dart';

import 'landing_screen.dart';
class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';
  final bool autoStart;

  const SplashScreen({Key key, this.autoStart = true}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.autoStart) {
        await start(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: const Hero(
            tag: "splash_logo",
            child: Center(
              child: Text(
                '${"Retail shop"} ',
                overflow: TextOverflow.fade,
                // overflow: TextOverflow.clip,
                softWrap: false,
                maxLines: 1,
                style: TextStyle(fontSize: 28,fontFamily: "Roboto",fontStyle: FontStyle.normal,fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future start(BuildContext context) async {
    Navigator.of(context).pushNamed(LandingScreen.id);  }
}
