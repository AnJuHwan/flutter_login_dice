import 'package:flutter/material.dart';
import 'dice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 50)),
              Center(
                child: Image(
                  image: AssetImage('image/chef.gif'),
                  width: 170.0,
                  height: 190.0,
                ),
              ),
              Form(
                child: Theme(
                  data: ThemeData(
                    primaryColor: Colors.teal,
                    inputDecorationTheme: InputDecorationTheme(
                      labelStyle: TextStyle(
                        color: Colors.teal,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(40.0),
                    child: Column(children: [
                      TextField(
                        controller: controller,
                        // autofocus: true, 페이지가 렌더 되자마자 포커스 해주는 기능
                        decoration: InputDecoration(
                          labelText: 'Enter dice',
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextField(
                        controller: controller2,
                        decoration: InputDecoration(
                          labelText: 'Enter Password',
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      SizedBox(height: 30.0),
                      ButtonTheme(
                          minWidth: 100.0,
                          height: 50.0,
                          child: ElevatedButton(
                            onPressed: () {
                              if (controller.text == 'dice' &&
                                  controller2.text == '1234') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Dice()));
                              } else if (controller.text == 'dice' &&
                                  controller2.text != '1234') {
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //     SnackBar(content: Text('비밀번호를 확인해주세요')));
                                showSnackBar2(context);
                              } else if (controller.text != 'dice' &&
                                  controller2.text == '1234') {
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //     SnackBar(content: Text('아이디를 확인해주세요')));
                                showSnackBar3(context);
                              } else {
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //     SnackBar(
                                //         content: Text('아이디 , 비밀번호를 확인해주세요')));
                                showSnackBar(context);
                              }
                            },
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 35.0,
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.orange)),
                          ))
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      '로그인 정보를 다시 확인하세요',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}

void showSnackBar2(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      '비밀번호 정보를 다시 확인하세요',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}

void showSnackBar3(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      'dice의 철자를 다시 확인하세요',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}
