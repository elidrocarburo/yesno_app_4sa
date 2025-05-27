import 'package:flutter/material.dart';
import 'package:yesno_app_4sa/config/helpers/get_yes_no_answer.dart';
import 'package:yesno_app_4sa/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  //controlador que maneja la posición del scroll
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [

  ];

  //evaluar algo que se envíe o no
  //async: asíncrono
  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    final newMessage = Message(text: text.trim(), fromWho: FromWho.me, time: DateTime.now());
    //agregar un nuevo mensaje a la lista
    messageList.add(newMessage);
    //detectar si el usuario hizo una pregunta
    if (text.endsWith('?')) {
      hisReply();
    }

    //print('Cantidad de mensajes: ${messageList.length}');

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
      //rebote al final de la animación
      curve: Curves.easeOut);

  }

  //Crear la respuesta de la otra persona
  Future<void>hisReply() async {
    //obtener el mensaje de la petición HTTP
    final hisMessage = await getYesNoAnswer.getAnswer();

    //añadir el mensaje de ella a la lista de mensajes
    messageList.add(hisMessage);

    //notificar a provider los cambios
    notifyListeners();

    //mover el scroll hasta el último mensaje
    moveScrollToBottom();
  }
}