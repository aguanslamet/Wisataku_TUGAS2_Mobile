import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wisataku/array.dart';
import 'package:wisataku/pagedetail.dart';




class Home extends StatefulWidget {
  final VoidCallback signOut;
  Home(this.signOut);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _buatlist() async {
    for (var i = 0; i < wisata.length; i++) {
      final wisataku = wisata[i];
      final String gambar = wisataku["gambar"];
      daftarwisata.add(
        Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            width: 210.0,
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0)
                  ]),
                  height: 180,
                  width: 180,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: Hero(
                        tag: wisataku['nama'],
                        child: Material(
                            child: InkWell(
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Detail(
                                              nama: wisataku['nama'],
                                              gambar: gambar,
                                              lokasi: wisataku['lokasi'],
                                              ket: wisataku['ket'],
                                            ))),
                                child: Image.asset("img/$gambar",
                                    fit: BoxFit.cover)))),
                  ),
                ),
                Positioned(
                  left: 10.0,
                  bottom: 10.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(wisataku["nama"],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          )),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            size: 12.0,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5.0),
                          Text(wisataku["lokasi"],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }



 signOut(){
   setState(() {
     widget.signOut();
   });
 }
  String username ="", nohp="";
 getPref() async{
   SharedPreferences preferences = await SharedPreferences.getInstance();
   setState(() {
     
     username = preferences.getString("username");
     nohp = preferences.getString("nohp");
   });
 }

 @override
  void initState() {
    _buatlist();
    getPref();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WisataKu',
            style: TextStyle(
              
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("$username",style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),),
              accountEmail: Text("$nohp",style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
              currentAccountPicture: Stack(
                children: <Widget>[
                        
                           ClipOval(
                               child: SizedBox(
                           width: 120.0,
                           height: 120.0,
                           child: InkWell(
                               onTap: () {
                                 
                               },
                               child:
                                   Image.asset(
                                       'img/profil.png',
                                       fit: BoxFit.fill,
                                     )
                                  ),
                         )),
                         Positioned(
                           bottom: 5.0,
                           left: 80,
                           child: InkWell( onTap: (){
                          
                           },
                                                         child: Container(
                               width: 40.0,
                               height: 40.0,
                               decoration: BoxDecoration(
                                 gradient: LinearGradient(colors: [
                                   Color(0xFF87C133),
                                   Color(0xFF13AA44)
                                 ]),
                                 shape: BoxShape.circle,
                               ),
                               child: Icon(
                                 Icons.camera_alt,
                                 color: Colors.white,
                                 size: 20.0,
                               ),
                             ),
                           ),
                         ),
                ],
              ),
            ),
            SizedBox(height: 10.0,),

            Padding(
              padding: const EdgeInsets.only(left:12.0),
              child: InkWell(
                onTap: (){
                signOut();
                },
                 
                            child: Row(
                  children: <Widget>[
                    
                    Icon(Icons.exit_to_app, size: 20.0,),
                    SizedBox(width: 10.0,),
                    Text(
                      "LogOut",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      
      body: GridView.count(
        crossAxisCount: 2,
        children: daftarwisata,
      ),
    );
  }
}
