import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: clock(),
    theme: ThemeData(fontFamily: 'SFPRO'),
  ));
}

class clock extends StatefulWidget {
  const clock({Key? key}) : super(key: key);

  @override
  State<clock> createState() => _clockState();
}

class _clockState extends State<clock> {
  Stream<String> getTime() async* {
    while (true) {
      await Future.delayed(Duration(seconds: 1));

      DateTime d = DateTime.now();
      String Time = "${d.hour} : ${d.minute} : ${d.second}";

      yield Time;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Stream Builder",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder(
        stream: getTime(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          } else {
            if (snapshot.hasData) {
              String Time = snapshot.data ?? "";

              return Center(
                child: Container(
                  height: 40,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                      color: Colors.white,
                      shadows: [
                        BoxShadow(
                            blurRadius: 7,
                            spreadRadius: 1,
                            offset: Offset(0, 3),
                            color: Colors.black.withOpacity(0.4))
                      ],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    "$Time",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                    ),
                  ),
                ),
              );
            }
            else
              {
                return Center(child: Text("No Data Found"),);
              }
          }
        },
      ),
    );
  }
}
