import 'dart:convert';
import 'package:wisataku/home.dart';
import 'package:wisataku/screen/daftar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';





class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

enum StatusLogin { notsignIn, signIn }

class _LoginState extends State<Login> {
  StatusLogin _statusLogin = StatusLogin.notsignIn;
  String nohp, password;
  final _formKey = GlobalKey<FormState>();

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  cek() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      masuk();
    }
  }

  masuk() async {
    final respon = await http.post(
        "http://192.168.43.138/mudamudi/api/login.php",
        body: {"nohp": nohp, "password": password});
    final data = jsonDecode(respon.body);
    int value = data['value'];
    String pesan = data['massage'];
    String userapi = data['username'];
    String nohpapi = data['nohp'];
    
    if (value == 1) {
      setState(() {
        _statusLogin = StatusLogin.signIn;
        savepref(value, userapi, nohpapi);
      });
      print(pesan);
    } else {
      print(pesan);
    }
  }
 
  savepref(int value, String username, String nohp ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
       preferences.setString("username", username);
        preferences.setString("nohp", nohp);
      preferences.commit();
    });
  }

  var value;
  getPref(int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");
      _statusLogin = value == 1 ? StatusLogin.signIn : StatusLogin.notsignIn;
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      preferences.commit();
      _statusLogin = StatusLogin.notsignIn;
    });
  }

  @override
  void initState() {
    super.initState();
    getPref(value);
  }

  @override
  Widget build(BuildContext context) {
    switch (_statusLogin) {
      case StatusLogin.notsignIn:
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('img/dieng.jpg'), fit: BoxFit.cover)),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black12, Colors.black87],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter),
              ),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    Center(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(40.0, 60.0, 40.0, 0.0),
                            child: Text("SIGN IN", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 40.0, right: 40.0),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  onSaved: (e) => nohp = e,
                                  validator: (e) {
                                    if (e.isEmpty) {
                                      return "pleace insert your Username";
                                    }
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.phone_android,
                                      size: 25.0,
                                      color: Color(0xFF87C133),
                                    ),
                                    hintText: "Nomor Hp",
                                    hintStyle: TextStyle(
                                        color: Colors.red,
                                        fontFamily: "Poppins-Medium",
                                        fontSize: 14.0),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.green)),
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  cursorColor: Colors.white,
                                  obscureText: _secureText,
                                  onSaved: (e) => password = e,
                                  validator: (e) {
                                    if (e.isEmpty) {
                                      return "pleace insert your password";
                                    }
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.lock,
                                      size: 25.0,
                                      color: Color(0xFF87C133),
                                    ),
                                    hintText: "Kata Sandi",
                                    suffixIcon: IconButton(
                                      onPressed: showHide,
                                      icon: Icon(
                                        _secureText
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                      color: Colors.white,
                                    ),
                                    hintStyle: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14.0,
                                      fontFamily: "Poppins-Medium",
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.green)),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          InkWell(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(100, 3, 100, 0),
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Color(0xFF87C133),
                                    Color(0xFF13AA44)
                                  ]),
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Color(0xFF6078ea).withOpacity(.3),
                                        offset: Offset(0.0, 8.0),
                                        blurRadius: 8.0)
                                  ]),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    cek();
                                  },
                                  child: Center(
                                    child: Text(
                                      "MASUK",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 19.0,
                                          fontFamily: "Poppins-Bold"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Belum Punya Akun? ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins-Medium"),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Register()));
                                },
                                child: Text(
                                  "DAFTAR",
                                  style: TextStyle(
                                      color: Color(0xFF87C133),
                                      fontSize: 18.0,
                                      fontFamily: "Poppins-Medium"),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
        break;
      case StatusLogin.signIn:
      return Home(signOut);
      break;
    } 
  }
}
