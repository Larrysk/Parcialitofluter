import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secuencia de Fibonacci',
      home: FibonacciScreen(),
    );
  }
}

class FibonacciScreen extends StatefulWidget {
  @override
  _FibonacciScreenState createState() => _FibonacciScreenState();
}

class _FibonacciScreenState extends State<FibonacciScreen> {
  int _fibonacciResult = 0;
  String _fibonacciSequence = '';
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Secuencia de Fibonacci'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingrese un número entero',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Calcular'),
              onPressed: () {
                setState(() {
                  int n = int.parse(_controller.text);
                  _fibonacciResult = fibonacci(n);
                  _fibonacciSequence = getFibonacciSequence(n);
                });
              },
            ),
            SizedBox(height: 20),
            Text('El resultado es: $_fibonacciResult'),
            SizedBox(height: 20),
            Text('La secuencia de Fibonacci es: $_fibonacciSequence'),
          ],
        ),
      ),
    );
  }

  int fibonacci(int n) {
    if (n <= 0) {
      return 0;
    } else if (n == 1) {
      return 1;
    } else {
      return fibonacci(n - 1) + fibonacci(n - 2);
    }
  }

  String getFibonacciSequence(int n) {
    String sequence = '';
    for (int i = 0; i <= n; i++) {
      sequence += fibonacci(i).toString() + ' ';
    }
    return sequence;
  }
}