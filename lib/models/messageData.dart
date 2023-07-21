import 'package:flutter/material.dart';

@immutable
class MessageData {
  MessageData(
      {required this.senderName,
      required this.message,
      required this.messageDate,
      required this.profilePic});
  final String senderName;
  final String message;
  final String messageDate;
  final String profilePic;
}
