import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
      ),
      home: MyHomePage(title: 'User Input Display'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, @required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _userInput = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _userInput = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'User Typed: ',
                ),
                const SizedBox(height: 20),
                Text(
                  _userInput,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Spacer(),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).primaryColor,
                        ),
                        text: 'Click here to join the ongoing HNG Internship',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            final url = 'https://internship.zuri.team/join';
                            if (await canLaunch(url)) {
                              await launch(url, forceSafariVC: false);
                            }
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Powered By:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        elevation: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/i4g.png', width: 40, height: 40),
            label: 'i4g',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/hng.png', width: 40, height: 40),
            label: 'hng',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/zuri.png', width: 40, height: 40),
            label: 'zuri',
          ),
        ],
      ),
    );
  }
}
