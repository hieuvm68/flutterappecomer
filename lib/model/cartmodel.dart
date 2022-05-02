// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// class CartModel {
//   final String name;
//   final String image;
//   final double price;
//   final int quentity;
//   final String color;
//   final String size;
//   CartModel({
//     @required this.price,
//     @required this.name,
//     @required this.image,
//     @required this.size,
//     @required this.color,
//     @required this.quentity,
//   });
// }
class CartModel extends Equatable {
  CartModel(
      {this.name,
      this.image,
      this.price,
      this.quentity,
      this.color,
      this.size});
  final String name;
  final String image;
  final double price;
  final int quentity;
  final String color;
  final String size;
  Map<String, Object> toJson() {
    return {
      "name": name,
      "image": image,
      "price": price,
      "quentity": quentity,
      "color": color,
      "size": size,
    };
  }

  @override
  List<Object> get props => [name, image, price, quentity, color, size];

  static CartModel fromJson(Map<String, dynamic> json) {
    return CartModel(
      name: json["name"] ?? "",
      image: json["image"] ?? "",
      price: json["price"] ?? 0,
      color: json["color"] ?? "",
      size: json["size"] ?? "",
      quentity: json["quentity"] ?? 0,
    );
  }

  static CartModel fromSnapshot(DocumentSnapshot snap) {
    return CartModel(
      name: snap.get("name").data() as String,
      image: snap.get("image").data() as String,
      price: snap.get("price").data() as double,
      size: snap.get("size").data() as String,
      color: snap.get("color").data() as String,
      quentity: snap.get("quentity").data() as int,
    );
  }

  Map<String, Object> toDocument() {
    return {
      "name": name,
      "image": image,
      "price": price,
      "quentity": quentity,
      "color": color,
      "size": size,
    };
  }
}
