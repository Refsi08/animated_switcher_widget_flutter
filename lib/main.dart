import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isON = false;
  Widget myWidget = Container(
    width: 200,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.red,
      border: Border.all(color: Colors.black, width: 3),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Animated Switcher"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedSwitcher(
                child: myWidget,
                duration: Duration(seconds: 1),
                transitionBuilder: (child, animation) => RotationTransition(
                  turns: animation,
                  child: child,
                ),
              ),
              Switch(
                  activeColor: Colors.green,
                  inactiveThumbColor: Colors.red,
                  inactiveTrackColor: Colors.blue[200],
                  value: isON,
                  onChanged: (newValue) {
                    isON = newValue;
                    setState(() {
                      if (isON)
                        myWidget = Container(
                          key: ValueKey(1),
                          width: 200,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(color: Colors.black, width: 3),
                          ),
                        );
                      // myWidget = SizedBox( // untuk merubah tampilan menjadi widget yang berbeda yaitu text
                      //   width: 200,
                      //   height: 100,
                      //   child: Center(
                      //     child: Text(
                      //       "ON",
                      //       style: TextStyle(
                      //           color: Colors.green,
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: 20),
                      //     ),
                      //   ),
                      // );
                      else
                        myWidget = Container(
                          key: ValueKey(2),
                          width: 200,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(color: Colors.black, width: 3),
                          ),
                        );
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
