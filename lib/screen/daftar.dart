import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String password, username, nohp;
  final _key = new GlobalKey<FormState>();

  bool _scureText = true;

  get body => null;
  showHide() {
    setState(() {
      _scureText = !_scureText;
    });
  }

  cek() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      save();
    }
  }

  save() async {
    final respon = await http
        .post("http://192.168.43.138/mudamudi/api/register.php", body: {
      "nohp": nohp,
      "password": password,
      "username": username,
    });

    final data = jsonDecode(respon.body);
    int value = data["value"];
    String pesan = data["message"];
    if (value == 1) {
      setState(() {
        Navigator.pop(context);
      });
    } else {
      print(pesan);
    }
  }

  @override
  Widget build(BuildContext context) {
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
            key: _key,
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 0.0),
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 40.0, right: 40.0),
                      child: Column(children: <Widget>[
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          onSaved: (e) => username = e,
                          validator: (e) {
                            if (e.isEmpty) {
                              return "pleace insert your Username";
                            }
                          },
                          decoration: InputDecoration(
                              hintText: "Username",
                              hintStyle: TextStyle(
                                  color: Colors.red,
                                  fontFamily: "Poppin s-Medium",
                                  fontSize: 14.0),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          onSaved: (e) => nohp = e,
                          validator: (e) {
                            if (e.isEmpty) {
                              return "pleace insert your Username";
                            }
                          },
                          decoration: InputDecoration(
                              hintText: "nohp",
                              hintStyle: TextStyle(
                                  color: Colors.red,
                                  fontFamily: "Poppin s-Medium",
                                  fontSize: 14.0),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          obscureText: _scureText,
                          onSaved: (e) => password = e,
                          validator: (e) {
                            if (e.isEmpty) {
                              return "pleace insert your password";
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Kata Sandi",
                            suffixIcon: IconButton(
                              onPressed: showHide,
                              icon: Icon(
                                _scureText
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
                                borderSide: BorderSide(color: Colors.green)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                        ),
                      ]),
                    ),
                  ],
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
                        gradient: LinearGradient(
                            colors: [Color(0xFF87C133), Color(0xFF13AA44)]),
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFF6078ea).withOpacity(.3),
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
                            "DAFTAR",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
