import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:shimysqldemo/register.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SHREE HARI INFOTECH"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /* new Hero(
                      tag: 'hero',
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
                child: CircleAvatar(
          backgroundColor: Colors.brown,
          radius: 48.0,
                  child:
          Image(image:AssetImage('assets/shilogo1.png') ),
        ),
      ),
    ),*/
            Image.asset('assets/shilogo1.png',
                width: 200, height: 200, fit: BoxFit.fill),
            Divider(
              height: 24.0,
            ),
            //Image.asset('assets/shilogo1.png'),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              textAlign: TextAlign.center,
              maxLines: 1,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.red[300], width: 32.0),
                      borderRadius: BorderRadius.circular(25.0)),
                  hintText: "e-mail id",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w300, color: Colors.grey)),
            ),
            Divider(
              height: 24.0,
            ),
            TextField(
              keyboardType: TextInputType.text,
              controller: passController,
              textAlign: TextAlign.center,
              maxLines: 1,
              obscureText: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.red[300], width: 32.0),
                      borderRadius: BorderRadius.circular(25.0)),
                  hintText: "password",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w300, color: Colors.grey)),
            ),
            Divider(
              height: 24.0,
            ),
            RaisedButton(
              onPressed: () async {
                var settings = new ConnectionSettings(
                    host: '192.168.0.110',
                    port: 3306,
                    user: 'test',
                    password: 'test',
                    db: 'testdb');
                var conn = await MySqlConnection.connect(settings);
                var result = await conn.query(
                    'insert into `user_reg` (`ur_email`,`ur_pass`) values (?,?)',
                    [emailController.text, passController.text]);
                print("New user's id: ${result.insertId}");
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(emailController.text),
                    );
                  },
                );
              },
              child: Text('login'),
              color: Colors.deepOrange,
              elevation: 4.0,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
              ),
              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
            ),
            Divider(
              height: 24.0,
            ),
            new Container(
                child: RaisedButton(
                
          child: Text('create a new account ?'),
    
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegisterPage()),
            );
          },
        ),),
          ],
        ),
      ),
    );
  }
}
