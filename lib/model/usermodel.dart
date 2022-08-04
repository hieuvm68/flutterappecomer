// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:equatable/equatable.dart';


class UserModel extends Equatable {
  
  final String userName;
  final String userEmail;
  final String userGender;
  final String userPhoneNumber;
  final String userImage;
  final String userAddress;
UserModel(
      {this.userName,
      this.userEmail,
      this.userGender,
      this.userPhoneNumber,
      this.userImage,
      this.userAddress});
  Map<String, Object> toJson() {
    return {
      "UserName": userName,
      "UserEmail": userEmail,
      "UserGender": userGender,
      "UserNumber": userPhoneNumber,
      "UserImage": userImage,
      "UserAddress": userAddress,
    };
  }

  @override
  List<Object> get props => [
        userName,
        userEmail,
        userGender,
        userPhoneNumber,
        userImage,
        userAddress
      ];

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json["UserName"] ?? "",
      userEmail: json["UserEmail"] ?? "",
      userGender: json["UserGender"] ?? "",
      userPhoneNumber: json["UserNumber"] ?? "",
      userAddress: json["UserAddress"] ?? "",
      userImage: json["UserImage"] ?? "",
    );
  }

  static UserModel fromSnapshot(DocumentSnapshot snap) {
    return UserModel(
      userName: snap.get("UserName").data() as String,
      userEmail: snap.get("UserEmail").data() as String,
      userGender: snap.get("UserGender").data() as String,
      userPhoneNumber: snap.get("UserNumber").data() as String,
      userAddress: snap.get("UserAddress").data() as String,
      userImage: snap.get("UserImage").data() as String,
    );
  }

  Map<String, Object> toDocument() {
    return {
      "UserName": userName,
      "UserEmail": userEmail,
      "UserGender": userGender,
      "UserNumber": userPhoneNumber,
      "UserImage": userImage,
      "UserAddress": userAddress,
    };
  }
}
