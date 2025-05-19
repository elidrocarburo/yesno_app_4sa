import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesno_app_4sa/domain/entities/message.dart';
import 'package:yesno_app_4sa/presentation/providers/chat_provider.dart';
import 'package:yesno_app_4sa/presentation/widgets/chat/his_message_bubble.dart';
import 'package:yesno_app_4sa/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yesno_app_4sa/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Padding( //espacio que tenemos antes del título
              padding: const EdgeInsets.all(4.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://i.pinimg.com/736x/d5/86/38/d58638349355821859c48eb74fcec469.jpg'),
              ),
            ), 
            title: Text('el que me debe dinero'),
            centerTitle: false,
        ),
        body: _ChatView(), // va a ser un widget privado
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //Le pide que esté pendiente de cambios
    final chatProvider = context.watch<ChatProvider>();

    
    return SafeArea( //sirve para acomodar elementos de la app que puedan interferir con partes del sistema operativo
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
            children: [
                Expanded( //listview: lista que permite scroll de widgets que se alinean de forma vertical
                    child: ListView.builder(
                      //enlaza el controlador creado en chat provider
                    controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder:(context, index) {
                      //instancia que sabrá de quién es el mensaje
                      final message = chatProvider.messageList[index];
                      //print('Cantidad de mensajes: $message');
                      //si el residuo es 0, es su mensaje, si no, es 0 es mío
                      //más fácil, si es par es su mensaje, si no, es mío
                      //return (index % 2 == 0)
                      return (message.fromWho == FromWho.his)
                      ? HisMessageBubble(message: message)
                      : MyMessageBubble(message: message);
                    },) //tener lista de elementos que se van a construir apenas/ya hayan/estén en pantalla, los demás elementos desaparecen
                ),
        
                // caja de texto
                MessageFieldBox(
                  onValue: chatProvider.sendMessage,
                  ),
            ],
        ),
      ),
    );
  }
}