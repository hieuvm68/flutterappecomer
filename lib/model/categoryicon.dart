// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryIcon extends Equatable {
  CategoryIcon({this.image});
  final String image;
  Map<String, Object> toJson() {
    return {"image": image};
  }

  @override
  List<Object> get props => [image];

  static CategoryIcon fromJson(Map<String, dynamic> json) {
    return CategoryIcon(image: json["image"] ?? "");
  }

  static CategoryIcon fromSnapshot(DocumentSnapshot snap) {
    return CategoryIcon(image: snap.get("image").data() as String);
  }

  Map<String, Object> toDocument() {
    return {"image": image};
  }
}
