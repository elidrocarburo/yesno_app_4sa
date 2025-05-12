import 'package:flutter/material.dart';
import 'package:yesno_app_4sa/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  //controlador que maneja la posición del scroll
  final ScrollController chatScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: "Hola", fromWho: FromWho.me),
    Message(text: "Dame dinero", fromWho: FromWho.his),

  ];

  //evaluar algo que se envíe o no
  //async: asíncrono
  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    final newMessage = Message(text: text.trim(), fromWho: FromWho.me);
    //agregar un nuevo mensaje a la lista
    messageList.add(newMessage);
    print('Cantidad de mensajes: ${messageList.length}');

    //notifica a provider que algo cambió
    notifyListeners();
    moveScrollToBottom();
  }

  //mover el scroll hasta abajo
  Future<void>moveScrollToBottom() async {
    //animación
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      //offset: posición del máximo scroll posible
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      //rebote al final de la ani
      curve: Curves.easeOut);

  }
}