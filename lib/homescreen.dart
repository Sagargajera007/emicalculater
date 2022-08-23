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
        ),
        drawer: Drawer(),
        body: Card(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20),
            children: [
              GridTile(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Color(0xff81d4fa),
                      ),
                      padding: EdgeInsets.only(bottom: 30),
                      child: Icon(
                        Icons.calculate_outlined,
                        size: 80,
                      )),
                  footer: Container(
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 1,left: 8),
                      child: Text("EMI Calculators",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  )),
              GridTile(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color(0xff81d4fa),
                  ),
                  child: Icon(
                    Icons.calculate_outlined,
                    size: 80,
                  ),
                ),
              ),
              GridTile(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color(0xff81d4fa),
                  ),
                  child: Icon(
                    Icons.calculate_outlined,
                    size: 80,
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
