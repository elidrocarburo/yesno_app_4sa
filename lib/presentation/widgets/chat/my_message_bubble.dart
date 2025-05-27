import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yesno_app_4sa/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  //variable de la identidad atómica Message
  final Message message;
  const MyMessageBubble({super.key, 
  //se añade la variable al constructor
  required this.message});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  message.text, 
                  style: const TextStyle(color: Colors.white),
                ),
                //hora y visto
                const SizedBox(height: 5),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  Text(
                  //agregar hora al mensaje con la libreria intl
                  DateFormat('HH:mm').format(message.time),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 10,
                  ),
                ), 
                Icon(Icons.check,
                    size: 14,
                    color: Colors.blue,),
                ],),
                
                
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),
        
      ],
    );
  }
}