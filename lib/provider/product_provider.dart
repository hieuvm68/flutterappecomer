import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/cartmodel.dart';
import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/model/usermodel.dart';
// ignore: unused_import
import 'package:e_commerce/screens/listproduct.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<Product> feature = [];
  Product featureData;

  List<CartModel> checkOutModelList = <CartModel>[];
  CartModel checkOutModel;
  List<UserModel> userModelList = <UserModel>[];
  static UserModel userModel;

  ///////////////////////////////////
  Future<void> getUserData() async {
    User currentUser = FirebaseAuth.instance.currentUser;

    QuerySnapshot userSnapShot =
        await FirebaseFirestore.instance.collection("User").get();

    List<UserModel> newList = [];
    userSnapShot.docs.forEach(
      (snap) {
         var data = snap.data() as Map<String, dynamic>;
        if (currentUser.uid == data['UserId']) {
          print("hello");
          userModel = UserModel(
            userName: data["UserName"] as String,
            userEmail: data["UserEmail"] as String,
            userGender: data["UserGender"] as String,
            userPhoneNumber: data["UserNumber"] as String,
            userAddress: data["UserAddress"] as String,
            userImage: data["UserImage"] as String,
          
          );
            print("hello2");
          newList.add(userModel);
        }

        //  return userModel;
        // if (newList != null) {
        //   userModelList = newList;
        //   notifyListeners();
        // }

          userModelList = newList;
          notifyListeners();
      },
    );
  }

  List<UserModel> get getUserModelList {
    return userModelList;
  }

 




///////////////////////////
  void deleteCheckoutProduct(int index) {
    checkOutModelList.removeAt(index);
    notifyListeners();
  }

  void clearCheckoutProduct() {
    checkOutModelList.clear();
    notifyListeners();
  }

  void getCheckOutData({
    int quentity,
    double price,
    String name,
    String color,
    String size,
    String image,
  }) {
    checkOutModel = CartModel(
      color: color,
      size: size,
      price: price,
      name: name,
      image: image,
      quentity: quentity,
    );
    checkOutModelList.add(checkOutModel);
  }

  List<CartModel> get getCheckOutModelList {
    return List.from(checkOutModelList);
  }

  int get getCheckOutModelListLength {
    return checkOutModelList.length;
  }

  Future<void> getFeatureData() async {
    QuerySnapshot featureSnapShot = await FirebaseFirestore.instance
        .collection("products")
        .doc("N5i7v31Hic3HiXeUsplI")
        .collection("featureproduct")
        .get();
    final List<Product> allData = featureSnapShot.docs.map((doc) {
      featureData = Product(
          name: doc["name"],
          image: doc["image"],
          price: doc["price"].toDouble());
      return featureData;
    }).toList();
    feature = allData;
    notifyListeners();
  }

  List<Product> get getFeatureList {
    return feature;
  }

  List<Product> homeFeature = [];

  Future<void> getHomeFeatureData() async {
    QuerySnapshot featureSnapShot =
        await FirebaseFirestore.instance.collection("homefeature").get();
    final List<Product> allData = featureSnapShot.docs.map((doc) {
      featureData = Product(
          name: doc["name"],
          image: doc["image"],
          price: doc["price"].toDouble());
      return featureData;
    }).toList();
    homeFeature = allData;
    notifyListeners();
  }

  List<Product> get getHomeFeatureList {
    return homeFeature;
  }

  List<Product> homeAchive = [];

  Future<void> getHomeAchiveData() async {
    QuerySnapshot featureSnapShot =
        await FirebaseFirestore.instance.collection("homechive").get();
    final List<Product> allData = featureSnapShot.docs.map((doc) {
      newAchivesData = Product(
          name: doc["name"],
          image: doc["image"],
          price: doc["price"].toDouble());
      return newAchivesData;
    }).toList();

    homeAchive = allData;
    notifyListeners();
  }

  List<Product> get getHomeAchiveList {
    return homeAchive;
  }

  List<Product> newAchives = [];
  Product newAchivesData;
  Future<void> getNewAchiveData() async {
    QuerySnapshot achivesSnapShot = await FirebaseFirestore.instance
        .collection("products")
        .doc("N5i7v31Hic3HiXeUsplI")
        .collection("newachives")
        .get();
    final List<Product> allData = achivesSnapShot.docs.map((doc) {
      newAchivesData = Product(
          name: doc["name"],
          image: doc["image"],
          price: doc["price"].toDouble());
      return newAchivesData;
    }).toList();
    newAchives = allData;
    notifyListeners();
  }

  List<Product> get getNewAchiesList {
    return newAchives;
  }

  List<String> notificationList = [];

  void addNotification(String notification) {
    notificationList.add(notification);
  }

  int get getNotificationIndex {
    return notificationList.length;
  }

  get getNotificationList {
    return notificationList;
  }

  List<Product> searchList;
  void getSearchList({List<Product> list}) {
    searchList = list;
  }

  List<Product> searchProductList(String query) {
    List<Product> searchShirt = searchList.where((element) {
      return element.name.toUpperCase().contains(query) ||
          element.name.toLowerCase().contains(query);
    }).toList();
    return searchShirt;
  }
}
