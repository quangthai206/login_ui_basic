import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LoginRoute(),
  ));
}

class LoginRoute extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Flutter login demo'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 60.0,
              ),
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/flutter-icon.png'),
                backgroundColor: Colors.transparent,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 50.0,
                left: 25.0,
                right: 25.0,
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.mail,
                    color: Colors.grey[500],
                    size: 22.0,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10.0,
                left: 25.0,
                right: 25.0,
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.lock,
                    color: Colors.grey[500],
                    size: 22.0,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 30.0,
                  left: 25.0,
                  right: 25.0,
                ),
                child: RaisedButton(
                  elevation: 5.0,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    if (emailController.text == "" || passwordController.text == "") {
                      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Please enter email and password!")));
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PersonalRoute(email: emailController.text)),
                      ).then((value) {
                        emailController.clear();
                        passwordController.clear();
                      });
                    }
                  },
                ),
              ),
            ),
            FlatButton(
              child: Text(
                'Create an account',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
              ),
              onPressed: () {},
            )
          ],
        ),
      );
  }

}

class PersonalRoute extends StatelessWidget {
  final String email;

  PersonalRoute({this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Homepage'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 50.0,
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage('images/avatar.jpg'),
              radius: 50.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 15.0,
              bottom: 40.0,
            ),
            child: Text(
              email,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico',
              ),
            ),
          ),
          FlatButton.icon(
            icon: Icon(
              Icons.exit_to_app,
            ),
            label: Text(
              'Logout',
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Container(
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
