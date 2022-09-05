import 'dart:math';

import 'package:emicalculater/withoutdpemi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
          backgroundColor: Color(0xff1e88e5),
          shadowColor: Colors.transparent,
        ),
        drawer: Drawer(),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xff1e88e5),
                boxShadow: [
                  new BoxShadow(blurRadius: 10.0, color: Color(0xff003c8f)),
                ],
                borderRadius: new BorderRadius.vertical(
                    bottom: new Radius.elliptical(
                        MediaQuery.of(context).size.width, 40.0)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    InkWell(onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        return withoutdpemi();
                      },));
                    },
                      child: Container(
                          height: 75,
                          width: 75,

                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Image.asset("assets/icon/calculator1.png"),
                          )),
                    ),
                    Text("EMI Calculater")
                  ],
                ),
                Column(
                  children: [
                    InkWell(onTap: () {

                    },
                      child: Container(
                        height: 75,
                        width: 75,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Image.asset("assets/icon/budget.png"),
                        ),
                      ),
                    ),
                    Text("Whit Down"),
                    Text("Payment EMI")
                  ],
                ),

                Column(
                  children: [
                    InkWell(onTap: () {

                    },
                      child: Container(
                        height: 75,
                        width: 75,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Image.asset("assets/icon/calculator.png"),
                        ),
                      ),
                    ),
                    Text("Advance"),
                    Text("EMI")
                  ],
                )
              ],
            )
          ],
        ));
  }
}
