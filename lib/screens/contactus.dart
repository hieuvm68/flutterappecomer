import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/usermodel.dart';
import 'package:e_commerce/provider/product_provider.dart';
import 'package:e_commerce/screens/homepage.dart';
import 'package:e_commerce/screens/login.dart';
import 'package:e_commerce/widgets/mybutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tawk/flutter_tawk.dart';
import 'package:provider/provider.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final TextEditingController message = TextEditingController();

  String name, email;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   void vaildation() async {
//     if (message.text.isEmpty) {
//       _scaffoldKey.currentState.showSnackBar(
//         SnackBar(
//           content: Text("Please Fill Message"),
//         ),
//       );
//     } else {
//       User user = FirebaseAuth.instance.currentUser;
//       FirebaseFirestore.instance.collection("Message").doc(user.uid).set({
//         "Name": name,
//         "Email": email,
//         "Message": message.text,
//       });
//     }
//   }

//   Widget _buildSingleFlied({String name}) {
//     return Container(
//       height: 60,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(5),
//         border: Border.all(color: Colors.grey),
//       ),
//       padding: EdgeInsets.only(left: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             name,
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }

  @override
  void initState() {
    ProductProvider provider;
    provider = Provider.of<ProductProvider>(context, listen: false);
    List<UserModel> user = provider.userModelList;
    user.map((e) {
      name = e.userName;
      email = e.userEmail;

      return Container();
    }).toList();

    super.initState();
  }

//   @override
//   Widget build(BuildContext context) {
//     print(name);
//     return WillPopScope(
//       onWillPop: () {
//         return Navigator.of(context)
//             .pushReplacement(MaterialPageRoute(builder: (ctx) => HomePage()));
//       },
//       child: Scaffold(
//         key: _scaffoldKey,
//         appBar: AppBar(
//           elevation: 0.0,
//           backgroundColor: Color(0xfff8f8f8),
//           iconTheme: IconThemeData(color: Colors.black),
//           title: IconButton(
//             icon: Icon(
//               Icons.arrow_back,
//               color: Color(0xff746bc9),
//               size: 35,
//             ),
//             onPressed: () {
//               Navigator.of(context).pushReplacement(
//                   MaterialPageRoute(builder: (ctx) => HomePage()));
//             },
//           ),
//         ),
//         body: Container(
//           padding: EdgeInsets.symmetric(horizontal: 27),
//           height: 600,
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Text(
//                 "Sent Us Your Message",
//                 style: TextStyle(
//                   color: Color(0xff746bc9),
//                   fontSize: 28,
//                 ),
//               ),
//               _buildSingleFlied(name: name),
//               _buildSingleFlied(name: email),
//               Container(
//                 height: 200,
//                 child: TextFormField(
//                   controller: message,
//                   expands: true,
//                   maxLines: null,
//                   textAlignVertical: TextAlignVertical.top,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     hintText: " Message",
//                   ),
//                 ),
//               ),
//               MyButton(
//                 name: "Submit",
//                 onPressed: () {
//                   vaildation();
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
           elevation: 0.0,
         
          backgroundColor: const Color(0XFFF7931E),
          iconTheme: IconThemeData(color: Colors.black),
          title: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff746bc9),
              size: 35,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => HomePage()));
            },
          ),
        ),
       
        body: Tawk(
          directChatLink: 'https://tawk.to/chat/626f91977b967b11798d667f/1g21t1ehm',
          visitor: TawkVisitor(
            name: name,
            email: email,
          ),
          onLoad: () {
            print('Hello Tawk!');
          },
          onLinkTap: (String url) {
            print(url);
          },
          placeholder: const Center(
            child: Text('Loading...'),
          ),
        ),
      ),
    );
  }}