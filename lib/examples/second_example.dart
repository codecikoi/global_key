import 'package:flutter/material.dart';

import 'package:global_key/widgets/text_row_widget.dart';

class SecondExample extends StatefulWidget {
  const SecondExample({Key? key}) : super(key: key);

  @override
  State<SecondExample> createState() => _SecondExampleState();
}

class _SecondExampleState extends State<SecondExample> {
  bool isSignedIn = false;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('GlobalKey the 2nd example'),
          centerTitle: true,
        ),
        body: isSignedIn ? buildHome() : buildLogin(),
      );

  Widget buildLogin() => Form(
        key: null,
        child: ListView(
          padding: EdgeInsets.all(24.0),
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'email',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value != null && !value.contains('@')
                  ? 'not valid email'
                  : null,
              onSaved: (value) => email = value!,
            ),
            SizedBox(height: 24.0),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'password',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value != null && value.length < 3
                  ? 'password needs min 3 characters'
                  : null,
              onSaved: (value) => password = value!,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[700],
                minimumSize: Size.fromHeight(40.0),
              ),
              child: FittedBox(
                child: Text(
                  'login',
                  style: TextStyle(fontSize: 20.0, color: Colors.white70),
                ),
              ),
            ),
          ],
        ),
      );

  void submit() {}

  Widget buildHome() => Container(
        padding: EdgeInsets.all(24.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24.0),
            TextRowWidget(title: 'email', value: email),
            TextRowWidget(title: 'password', value: password),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () => setState(() => isSignedIn = false),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[700],
                minimumSize: Size.fromHeight(40.0),
              ),
              child: FittedBox(
                child: Text(
                  'sign out',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
