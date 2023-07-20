import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Máy tính'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late TextEditingController _aController;
  late TextEditingController _bController;
  String _result = '';

  @override
  void initState() {
    super.initState();
    _aController = TextEditingController();
    _bController = TextEditingController();
  }

  @override
  void dispose() {
    _aController.dispose();
    _bController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  String convertToWords(int number) {
    if (number == 0) {
      return "zero";
    }

    List<String> ones = [
      "", "một", "hai", "ba", "bốn", "năm", "sáu", "bảy", "tám", "chín",
      "mười", "mười một", "mười hai", "mười ba", "mười bốn", "mười lăm", "mười sáu",
      "mười bảy", "mười tám", "mười chín"
    ];

    List<String> tens = [
      "", "", "hai mươi", "ba mươi", "bốn mươi", "năm mươi", "sáu mươi", "bảy mươi", "tám mươi", "chín mươi"
    ];

    String convertGroup(int num) {
      String result = "";

      if (num >= 100) {
        if(num % 100 < 10){
          int hundred = num ~/ 100;
          result += "${ones[hundred]} trăm lẻ ";
          num %= 100;
        }else{
          int hundred = num ~/ 100;
          result += "${ones[hundred]} trăm ";
          num %= 100;
        }
      }

      if (num >= 20) {
        int ten = num ~/ 10;
        result += "${tens[ten]} ";
        num %= 10;
      }

      if (num > 0) {
        result += ones[num];
      }

      return result.trim();
    }

    String result = "";

    if (number >= 1000) {
      int thousand = number ~/ 1000;
      result += "${convertGroup(thousand)} ngàn ";
      number %= 1000;
    }

    result += convertGroup(number);

    return result;
  }

  void _onAdd() {
    int a = int.tryParse(_aController.text) ?? 0;
    int b = int.tryParse(_bController.text) ?? 0;
    int sum = a + b;
    setState(() {
      _result = 'Kết quả: ${(sum)}';
    });
  }

  void _onSubtract() {
    int a = int.tryParse(_aController.text) ?? 0;
    int b = int.tryParse(_bController.text) ?? 0;
    int difference = a - b;
    setState(() {
      _result = 'Kết quả: ${(difference)}';
    });
  }

  void _onMultiply() {
    int a = int.tryParse(_aController.text) ?? 0;
    int b = int.tryParse(_bController.text) ?? 0;
    int product = a * b;
    setState(() {
      _result = 'Kết quả: ${(product)}';
    });
  }

  void _onDivide() {
    int a = int.tryParse(_aController.text) ?? 0;
    int b = int.tryParse(_bController.text) ?? 1;
    double quotient = a / b;
    setState(() {
      _result = 'Kết quả: ${(quotient.toInt())}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Đoàn Dzoãn Tường Anh',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 16),
            Image.asset(
              'assets/images/pngtree-computer-png-image_111480.png',
              height: 100,
              width: 100,
            ),

            const SizedBox(height: 20),
            TextField(
              controller: _aController,
              decoration: InputDecoration(labelText: 'nhập số a'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _bController,
              decoration: InputDecoration(labelText: 'nhập số b'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _onAdd,
                  child: Text(
                    '+',
                    style: TextStyle(
                      color: Colors.black, // Đặt màu chữ cho nút (màu đen)
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Đặt màu nền cho nút (màu vàng)
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0), // Đặt giá trị theo nhu cầu
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _onSubtract,
                  child: Text(
                    '-',
                    style: TextStyle(
                      color: Colors.black, // Đặt màu chữ cho nút (màu đen)
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Đặt màu nền cho nút (màu vàng)
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0), // Đặt giá trị theo nhu cầu
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _onMultiply,
                  child: Text(
                    '*',
                    style: TextStyle(
                      color: Colors.black, // Đặt màu chữ cho nút (màu đen)
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Đặt màu nền cho nút (màu xanh)
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0), // Đặt giá trị theo nhu cầu
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _onDivide,
                  child: Text(
                    '/',
                    style: TextStyle(
                      color: Colors.black, // Đặt màu chữ cho nút (màu đen)
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.yellow, // Đặt màu nền cho nút (màu vàng)
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0), // Đặt giá trị theo nhu cầu
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),

    );
  }
}