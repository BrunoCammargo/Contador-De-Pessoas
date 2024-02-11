import 'package:flutter/material.dart';

void main() {
  runApp( const MeuApp() );
}

// Widget Responsavel pelo aplicativo
class MeuApp extends StatelessWidget {
  const MeuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: HomePage(), 
      debugShowCheckedModeBanner: false,
    );
  }
}


// Widget Responsavel por ser a home do aplicativo
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Atributos
  int count = 0;
  int maxCount = 10;
  String txt = 'Pode Entra!';
  Color colorTxt = Colors.white;

  //Metodos
  void decrement()
  {
    if(count > 0)
    {
      setState(() {
        count--;
        txt = 'Pode Entar!';
        colorTxt = Colors.white;
      });
    }
  }

  void increment()
  {
    if(count < maxCount)
    {
      setState(() {
        count++;
        if(count == 10) {
          txt = 'Lotado!';
          colorTxt = Colors.redAccent;
        }
      });
    }
  }

  bool get isFull => count == maxCount;
  bool get isEmpty => count == 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(33, 33, 33, 1.0),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/imagens/bg_image.png'), fit: BoxFit.cover)),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(this.txt,
                  style: TextStyle(fontSize: 32, color: colorTxt, fontWeight: FontWeight.w900)),
              Padding(padding: const EdgeInsets.only(top:30, bottom: 30),
                  child: Text('${this.count}',
                      style: TextStyle(fontSize: 100, color: colorTxt, fontWeight: FontWeight.w900))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                          fixedSize: const Size(100, 100),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)) ), // TextButton.styleFrom
                      onPressed: increment,
                      child: const Text('Entrou', style: TextStyle(color: Colors.black, fontSize: 18) )),

                  const SizedBox(width: 32, height: 200,),

                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: isEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
                          fixedSize: const Size(100, 100),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)) ), // TextButton.styleFrom
                      onPressed: decrement,
                      child: const Text( 'Saiu', style: TextStyle(color: Colors.black, fontSize: 18) )),
                  //GridView(gridDelegate: gridDelegate)

                ], // childrens -> Row
              )
            ],  // childrens -> Column
          ),
        )
    );
  }

}
