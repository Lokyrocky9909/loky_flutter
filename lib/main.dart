import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            child: Image.asset(
              "assets/burger.jpg",
            ),
          ),
          Text(
            "BURGER KING",
            style: (TextStyle(
                fontSize: 40.0,
                color: Colors.black87, //font color
                backgroundColor: Colors.black12, //background color
                letterSpacing: 5, //letter spacing
                decoration: TextDecoration.lineThrough, //make underline
                decorationStyle: TextDecorationStyle.double, //double underline
                decorationColor:
                    Colors.yellow, //text decoration 'underline' color
                decorationThickness: 0.5, //decoration 'underline' thickness
                fontStyle: FontStyle.normal)),
          ),
          SizedBox(
            height: 40,
          ),
          Form(
            key: formkey,
            child: Container(
                child: SizedBox(
              width: 300,
              child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "please enter user name";
                    } else if (value.length > 8) {
                      return "type maximum 8 characters";
                    }
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle),
                    iconColor: Colors.black87,
                    hintText: "user name",
                    hintStyle: TextStyle(color: Colors.black87),
                  )),
            )),
          ),
          Container(
              child: SizedBox(
            width: 300,
            child: TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please enter your password";
                  }
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  iconColor: Colors.black87,
                  hintText: "password",
                  hintStyle: TextStyle(color: Colors.black87),
                )),
          )),
          SizedBox(
            height: 15,
          ),
          Container(
            child: ButtonTheme(
                buttonColor: Colors.black87,
                height: 50.0,
                minWidth: double.infinity,
                child: TextButton(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.yellow),
                  ),
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Form validated succesfully")));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => firstPage()));
                    } else
                      () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Error in Form")));
                      };
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.black87)),
                )),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Forget password?",
            style: TextStyle(decoration: TextDecoration.underline),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              child: Image.asset(
                "assets/google logo.webp",
                height: 40,
              ),
            ),
            Image.asset(
              "assets/twitter logo.png",
              height: 30,
            )
          ]),
        ]),
      ),
    ));
  }
}

class firstPage extends StatelessWidget {
  const firstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, position) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(60.0),
                child: ListTile(
                    leading: Image.asset(
                  "assets/burger logo.png",
                  height: 50,
                )),
              ),
            );
          },
        ),
      ),
    );
  }
}
