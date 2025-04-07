import 'package:flutter/material.dart';
import 'package:yesno_app_4sa/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: "Hola", fromWho: FromWho.me),
    Message(text: "Dame dinero", fromWho: FromWho.his),

  ];
}