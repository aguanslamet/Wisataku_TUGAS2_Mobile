import 'package:flutter/material.dart';


class Detail extends StatefulWidget {
  Detail({this.nama, this.gambar, this.lokasi, this.ket});
  final String lokasi;
  final String nama;
  final String gambar;
  final String ket;

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
    
  Widget _buildIcon(int index) {
    return Container(
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(10.0), boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 4.0,
                          )
                        ]),
                        alignment: Alignment.center,
      child: Text("Deskripsi",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold, color:  Colors.white),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 240.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0,
                          )
                        ]),
                    child: Hero(
                        tag: widget.nama,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30.0),
                              bottomLeft: Radius.circular(30.0)),
                          child: Image.asset(
                            "img/${widget.gambar}",
                            fit: BoxFit.cover,
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Positioned(
                      left: 20.0,
                      bottom: 20.0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(widget.nama,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                )),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.location_on,
                                  size: 16.0,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5.0),
                                Text(widget.lokasi,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    )),
                              ],
                            )
                          ])),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left:12.0, right: 12.0),
            child: _buildIcon(0),
          ),
          
          
          Container(
            padding: EdgeInsets.only(left:5.0, right: 5.0),
            child: Card(
              
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                  child:
                    Text(widget.ket,  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,), textAlign:TextAlign.justify,),
              ),
            ),
          )
        ],
      ),
    );
  }
}
