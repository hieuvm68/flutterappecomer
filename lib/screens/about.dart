import 'package:e_commerce/screens/homepage.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (ctx) => HomePage()));
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xfff8f8f8),
          title: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 35,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => HomePage()));
            },
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 27),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "About",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                      ),
                    ),
                  ]),
              Image(
                image: AssetImage("images/huflit.jpg"),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                width: 350,
                child: Wrap(
                  children: [
                    Text(
                      "Application that sells electronics, this product helps you experience the best products from the manufacturer HVM@HUFLIT. ",
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                    Text(
                      "By developer HVM-TEAM",
                      style: TextStyle(fontSize: 18, color: Colors.black26),
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
