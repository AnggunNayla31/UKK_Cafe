import 'package:flutter/material.dart';
import 'package:kasir_cafe/controllers/login_controller.dart';
import 'daftar_transaksi2.dart'; // Pastikan halaman DaftarTransaksi sudah diimpor
import 'menulist.dart'; // Pastikan halaman MenuList sudah diimpor
import 'package:shared_preferences/shared_preferences.dart';

class Login_Page2 extends StatefulWidget {
  @override
  _LoginPage2State createState() => _LoginPage2State();
}

class _LoginPage2State extends State<Login_Page2> {

  final formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool loading = false;
  LoginController? loginAction = LoginController();

  String message = '';
  String? _errorUsername;
  String? _errorPassword;
  double _opacity = 0.0;
  double _scale = 0.9;
  bool _obscurePassword = true; // Untuk mengontrol visibilitas password

  void _validateInput() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });

      // Mengirim data login ke controller
      Map data = {
        'username': _usernameController.text,
        'password': _passwordController.text,
      };
      var login = await loginAction!.loginAct(data);

      if (login.status == true) {
        // Role-based navigation
        if (login.role == 'cashier') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MenuList()),
          );
        } else if (login.role == 'manager') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DaftarTransaksi()),
          );
        } else {
          setState(() {
            message = 'Role tidak dikenali';
          });
        }
      } else {
        setState(() {
          message = 'Username dan password salah';
        });
      }

      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1.0;
        _scale = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome Wikusama Cafe',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF8B0000), // Warna merah matang untuk AppBar
        titleSpacing: 0,
        leading: SizedBox(), // Menghilangkan tanda panah (back button) jika ada
      ),
      body: Form(
        key: formKey,
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(seconds: 1),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/cafe.jpg'), // Path gambar background
                fit: BoxFit.fill,
              ),
            ),
            child: Center(
              child: Container(
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Create Your Account',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    // Kolom input username
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) => value!.isEmpty ? 'Username tidak boleh kosong' : null,
                      ),
                    ),
                    // Kolom input password
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword ? Icons.visibility_off : Icons.visibility,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        validator: (value) => value!.isEmpty ? 'Password tidak boleh kosong' : null,
                      ),
                    ),
                    SizedBox(height: 35),
                    // Tombol login
                    ElevatedButton(
                      onPressed: _validateInput,
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF8B0000),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                      ),
                    ),
                    Text(message),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
