import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/categoryicon.dart';
import 'package:e_commerce/model/product.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  List<Product> football = [];
  Product footballData; //laptop
  List<Product> basketball = [];
  Product basketballData; //mobi
  List<Product> jordan = [];
  Product jordanData; //mouse
  List<Product> running = [];
  Product runningData; //ram
  List<Product> gym = [];
  Product gymData; //gym

  List<CategoryIcon> footballIcon = <CategoryIcon>[];
  CategoryIcon footballiconData;
  Future<void> getFootballIconData() async {
    QuerySnapshot footballSnapShot = await FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("ThwmwBGHcgmPyhaimAp7")
        .collection("basketball")
        .get();
    final List<CategoryIcon> icondata = footballSnapShot.docs.map((doc) {
      footballiconData = CategoryIcon(image: doc["image"]);
      return footballiconData;
    }).toList();
    footballIcon = icondata;
    notifyListeners();
  }

  List<CategoryIcon> get getFootballIcon {
    return footballIcon;
  }

  List<CategoryIcon> basketballIcon = [];
  CategoryIcon basketballiconData;
  Future<void> getShirtIcon() async {
    QuerySnapshot basketballSnapShot = await FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("ThwmwBGHcgmPyhaimAp7")
        .collection("basketball")
        .get();
    final List<CategoryIcon> allData = basketballSnapShot.docs.map((doc) {
      basketballiconData = CategoryIcon(image: doc["image"]);
      return basketballiconData;
    }).toList();
    basketballIcon = allData;

    notifyListeners();
  }

  List<CategoryIcon> get getBasketballIconData {
    return basketballIcon;
  }

  List<CategoryIcon> jordanIcon = [];
  CategoryIcon jordaniconData;
  Future<void> getmouseIconData() async {
    QuerySnapshot jordanSnapShot = await FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("ThwmwBGHcgmPyhaimAp7")
        .collection("basketball")
        .get();
    final List<CategoryIcon> allData = jordanSnapShot.docs.map((doc) {
      jordaniconData = CategoryIcon(image: doc["image"]);
      return jordaniconData;
    }).toList();
    jordanIcon = allData;

    notifyListeners();
  }

  List<CategoryIcon> get getJordanIcon {
    return jordanIcon;
  }

  List<CategoryIcon> runningIcon = [];
  CategoryIcon runningiconData;
  Future<void> getRamIconData() async {
    QuerySnapshot runningSnapShot = await FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("ThwmwBGHcgmPyhaimAp7")
        .collection("basketball")
        .get();
    final List<CategoryIcon> allData = runningSnapShot.docs.map((doc) {
      runningiconData = CategoryIcon(image: doc["image"]);
      return runningiconData;
    }).toList();
    runningIcon = allData;

    notifyListeners();
  }

  List<CategoryIcon> get getRunningIcon {
    return runningIcon;
  }

  List<CategoryIcon> gymIcon = [];
  CategoryIcon gymIconData;
  Future<void> getVgaIconData() async {
    QuerySnapshot gymSnapShot = await FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("ThwmwBGHcgmPyhaimAp7")
        .collection("basketball")
        .get();
    final List<CategoryIcon> allData = gymSnapShot.docs.map((doc) {
      gymIconData = CategoryIcon(image: doc["image"]);
      return gymIconData;
    }).toList();
    gymIcon = allData;

    notifyListeners();
  }

  List<CategoryIcon> get getGymIcon {
    return gymIcon;
  }

///////////////////////////////////////Category
  Future<void> getBasketballData() async {
    QuerySnapshot basketballSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("lS07s40lLJBixNMxXtzo")
        .collection("Basketball")
        .get();

    final List<Product> allData = basketballSnapShot.docs.map((doc) {
      basketballData = Product(
          name: doc["name"],
          image: doc["image"],
          price: doc["price"].toDouble());
      return basketballData;
    }).toList();
    basketball = allData;
    notifyListeners();
  }

  List<Product> get getBasketballList {
    return basketball;
  }

  Future<void> getFootballData() async {
    QuerySnapshot footballSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("lS07s40lLJBixNMxXtzo")
        .collection("Footbal")
        .get();

    final List<Product> allData = footballSnapShot.docs.map((doc) {
      footballData = Product(
          name: doc["name"],
          image: doc["image"],
          price: doc["price"].toDouble());
      return footballData;
    }).toList();
    football = allData;
    notifyListeners();
  }

  List<Product> get getFootballList {
    return football;
  }

  Future<void> getJordanData() async {
    QuerySnapshot jordanSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("lS07s40lLJBixNMxXtzo")
        .collection("Jordan")
        .get();

    final List<Product> allData = jordanSnapShot.docs.map((doc) {
      jordanData = Product(
          name: doc["name"],
          image: doc["image"],
          price: doc["price"].toDouble());
      return jordanData;
    }).toList();
    jordan = allData;
    notifyListeners();
  }

  List<Product> get getJordanList {
    return jordan;
  }

  Future<void> getRunningData() async {
    QuerySnapshot runningSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("lS07s40lLJBixNMxXtzo")
        .collection("Running")
        .get();

    final List<Product> allData = runningSnapShot.docs.map((doc) {
      runningData = Product(
          name: doc["name"],
          image: doc["image"],
          price: doc["price"].toDouble());
      return runningData;
    }).toList();
    running = allData;
    notifyListeners();
  }

  List<Product> get getRunningList {
    return running;
  }

  Future<void> getGymData() async {
    QuerySnapshot gymSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("lS07s40lLJBixNMxXtzo")
        .collection("gym")
        .get();

    final List<Product> allData = gymSnapShot.docs.map((doc) {
      gymData = Product(
          name: doc["name"],
          image: doc["image"],
          price: doc["price"].toDouble());
      return gymData;
    });
    gym = allData;
    notifyListeners();
  }

  List<Product> get getGymList {
    return gym;
  }

  List<Product> searchList;
  void getSearchList({List<Product> list}) {
    searchList = list;
  }

  List<Product> searchCategoryList(String query) {
    List<Product> searchShirt = searchList.where((element) {
      return element.name.toUpperCase().contains(query) ||
          element.name.toLowerCase().contains(query);
    }).toList();
    return searchShirt;
  }
}
