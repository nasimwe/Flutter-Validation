import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:validation/screen/login.dart';
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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: RegisterForm(),



      )
    );
  }
}



// Define a custom Form widget.
class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}


class RegisterFormState extends State<RegisterForm> {

  final _formKey = GlobalKey<FormState>();
   final TextEditingController _namecontroller =TextEditingController();
    final TextEditingController _emailcontroller = TextEditingController();
      final TextEditingController _phonecontroller = TextEditingController();
        final TextEditingController _addrescontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child:  Container(
        margin: EdgeInsets.all(10) ,
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        
             const SizedBox(height: 15),
             TextFormField(
        controller: _namecontroller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Name",
        ),),
        
             
             SizedBox(height: 15),
             TextFormField(
        controller: _emailcontroller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Email",
        ),
          // The validator receives the text that the user has entered.
        
        
         validator: (value) {
           print("email validated ${_emailcontroller.text} ${ EmailValidator.validate(_emailcontroller.text)}");
            if (value == null || value.isEmpty) {
        return 'Please enter your email';
            }  else  if  (! EmailValidator.validate(_emailcontroller.text)){
           return 'Please enter a valid email';
            }
            return null;
          
          },
        ),
        
        const SizedBox(height: 15),
        TextFormField(
          controller: _phonecontroller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Address",
        ),
          // The validator receives the text that the user has entered.
          
         validator: (value) {
            if (value == null || value.isEmpty) {
        return 'Please enter your address ';
            } 
            return null;
          },
        ),
        const SizedBox(height: 15),
        TextFormField(
          controller: _addrescontroller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Contact",
        ),
          // The validator receives the text that the user has entered.
          validator: (value) {
            if (value == null || value.isEmpty) {
        return 'Please enter Your Contact';
            }
            return null;
          },
        ),
        
        
        
        
        ElevatedButton(
          onPressed: () {
        
            print(_emailcontroller.text);
            // Validate returns true if the form is valid, or false otherwise.
            if (_formKey.currentState!.validate()) {
        // If the form is valid, display a snackbar. In the real world,
        // you'd often call a server or save the information in a database.
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Processing Data')),
        );
            }
          },
          child: const Text('Submit'),
        
        
        
        ),
        
        const SizedBox(height: 50),
        Row(
        
          children: [
             Text("Already have an account"),
            ElevatedButton(onPressed: (){
        
             Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        
            }, child: Text("Login"))
          ],
        
        )
          ],
        ),
      ),
    );
  }
}
