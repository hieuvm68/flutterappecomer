import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class Product  {
 
  final String name;
  final String image;
  final double price;


   Product({@required this.name,@required this.image,@required this.price});
  Map<String, Object> toJson() {
    return {
      "name": name,
      "image": image,
      "price": price,
    };
  }

  List<Object> get props => [name, image, price];

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
      name: json["name"] ?? "",
      image: json["image"] ?? "",
      price: json["price"] ?? 0,
    );
  }

  static Product fromSnapshot(DocumentSnapshot snap) {
    return Product(
      name: snap.get("name").data() as String,
      image: snap.get("image").data() as String,
      price: snap.get("price").data() as double,
    );
  }

  Map<String, Object> toDocument() {
    return {
      "name": name,
      "image": image,
      "price": price,
    };
  }
}
