import 'package:e_commerce/screens/checkout.dart';
import 'package:e_commerce/screens/homepage.dart';
import 'package:e_commerce/widgets/mybutton.dart';
import 'package:e_commerce/widgets/notification_button.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import '../provider/product_provider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final String image;
  final String name;
  final double price;
  DetailScreen({this.image, this.name, this.price});
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int count = 1;
  ProductProvider productProvider;

  // Widget _buildColorProduct({Color color}) {
  //   return Container(
  //     height: 40,
  //     width: 40,
  //     color: color,
  //   );
  // }

  final TextStyle myStyle = TextStyle(
    fontSize: 18,
  );
  Widget _buildImage() {
    return Center(
      child: Container(
        width: 380,
        child: Card(
          child: Container(
            padding: EdgeInsets.all(13),
            child: Container(
              height: 260,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(widget.image),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameToDescriptionPart() {
    return Container(
      height: 100,
      child: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(widget.name, style: myStyle),
              Text(
                "\$ ${widget.price.toString()}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text("Description", style: myStyle),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDiscription() {
    return Container(
      height: 170,
      child: Wrap(
        children: <Widget>[
          Text(
            "Free delivery for orders from 800%. ",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "100% genuine guarantee.",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "Return within 10 days. ",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "Home Warranty. ",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "Shopping guide. ",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "Refund warranty policy. ",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "Installment purchase policy. ",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "Support project and business customers. Instructions for ordering Flash Sale",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  List<bool> sized = [true, false, false, false,false, false,false];
  // List<bool> colored = [true, false, false, false];
  int sizeIndex = 0;
  String size;
  void getSize() {
    if (sizeIndex == 0) {
      setState(() {
        size = "38";
      });
    } else if (sizeIndex == 1) {
      setState(() {
        size = "39";
      });
    } else if (sizeIndex == 2) {
      setState(() {
        size = "40";
      });
    } else if (sizeIndex == 3) {
      setState(() {
        size = "41";
      });
    }
    else if (sizeIndex == 4) {
      setState(() {
        size = "42";
      });
    }
    else if (sizeIndex == 5) {
      setState(() {
        size = "43";
      });
    }
    
    else if (sizeIndex == 6) {
      setState(() {
        size = "44";
      });
    } 
 
   
  }

  // int colorIndex = 0;
  // String color;
  // void getColor() {
  //   if (colorIndex == 0) {
  //     setState(() {
  //       color = "Light Blue";
  //     });
  //   } else if (colorIndex == 1) {
  //     setState(() {
  //       color = "Light Green";
  //     });
  //   } else if (colorIndex == 2) {
  //     setState(() {
  //       color = "Light Yellow";
  //     });
  //   } else if (colorIndex == 3) {
  //     setState(() {
  //       color = "Cyan";
  //     });
  //   }
  // }

  // ignore: unused_element
  Widget _buildSizePart() {
    return Column(
      
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Size",
          style: myStyle,
        ),
        SizedBox(
          height: 15,
          
        ),
        Container(
          
          width: MediaQuery.of(context).size.width,
          
         
            child: 
              ToggleButtons(
                
                children: [
                  Text("38"),
                  Text("39"),
                  Text("40"),
                  Text("41"),
                  Text("42"),
                  Text("43"),
                  Text("44"),
                ],
                
                onPressed: (int index) {
                  setState(() {
                    for (int indexBtn = 0; indexBtn < sized.length; indexBtn++) {
                      if (indexBtn == index) {
                        sized[indexBtn] = true;
                      } else {
                        sized[indexBtn] = false;
                      }
                    }
                  });
                  setState(() {
                    sizeIndex = index;
                  });
                },
                isSelected: sized,
              ),
            
          ),
        
      ],
    );
  }

  // ignore: unused_element
  // Widget _buildColorPart() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: <Widget>[
  //       SizedBox(
  //         height: 10,
  //       ),
  //       Text(
  //         "Color",
  //         style: myStyle,
  //       ),
  //       SizedBox(
  //         height: 15,
  //       ),
  //       Container(
  //         width: 265,
  //         child: ToggleButtons(
  //           fillColor: Color(0xff746bc9),
  //           renderBorder: false,
  //           children: [
  //             _buildColorProduct(color: Colors.blue[200]),
  //             _buildColorProduct(color: Colors.green[200]),
  //             _buildColorProduct(color: Colors.yellow[200]),
  //             _buildColorProduct(color: Colors.cyan[300]),
  //           ],
  //           onPressed: (int index) {
  //             setState(() {
  //               for (int indexBtn = 0; indexBtn < colored.length; indexBtn++) {
  //                 if (indexBtn == index) {
  //                   colored[indexBtn] = true;
  //                 } else {
  //                   colored[indexBtn] = false;
  //                 }
  //               }
  //             });
  //             setState(() {
  //               colorIndex = index;
  //             });
  //           },
  //           isSelected: colored,
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildQuentityPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Text(
          "Quentity",
          style: myStyle,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 40,
          width: 130,
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
                onTap: () {
                  setState(() {
                    if (count > 1) {
                      count--;
                    }
                  });
                },
              ),
              Text(
                count.toString(),
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              GestureDetector(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onTap: () {
                  setState(() {
                    count++;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButtonPart() {
    return Container(
      height: 60,
      child: MyButton(
        name: "Add To Cart",
        onPressed: () {
          getSize();
          // getColor();
          productProvider.getCheckOutData(
            image: widget.image,
            // color: color,
            size: size,
            name: widget.name,
            price: widget.price,
            quentity: count,
          );
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => CheckOut(),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        return Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => HomePage(),
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Detail Page", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => HomePage(),
                ),
              );
            },
          ),
          actions: <Widget>[
            NotificationButton(),
          ],
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              _buildImage(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildNameToDescriptionPart(),
                    _buildDiscription(),
                    _buildSizePart(),
                    // _buildColorPart(),
                    _buildQuentityPart(),
                    SizedBox(
                      height: 15,
                    ),
                    _buildButtonPart(),
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
