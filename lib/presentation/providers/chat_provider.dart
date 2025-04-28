import 'package:flutter/material.dart';
import 'package:yesno_app_4sa/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: "Hola", fromWho: FromWho.me),
    Message(text: "Dame dinero", fromWho: FromWho.his),

  ];

  //evaluar algo que se envíe o no
  //async: asíncrono
  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);
    //agregar un nuevo mensaje a la lista
    messageList.add(newMessage);
    //notifica a provider que algo cambió
    notifyListeners();
  }
}