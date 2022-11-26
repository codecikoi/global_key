import 'package:flutter/material.dart';
import 'package:global_key/examples/utilities.dart';

final counterKey = GlobalKey<_CounterWidgetState>();

class FirstExample extends StatelessWidget {
  const FirstExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GlobalKey the 1st example'),
        centerTitle: true,
        backgroundColor: Colors.indigo[300],
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CounterWidget(
              key: counterKey,
            ),
            ElevatedButton(
              onPressed: () {
                final counter = counterKey.currentState?.counter;
                counterKey.currentState?.add();
                final newCounter = counterKey.currentState?.counter;

                Utils.showSnackBar(context,
                    text: 'Counter: $counter -> $newCounter');
              },
              child: Text('add'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late int counter;

  @override
  void initState() {
    counter = 0;
    super.initState();
  }

  void add() => setState(() => counter += 10);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$counter',
      style: TextStyle(
        fontSize: 32.0,
      ),
    );
  }
}
