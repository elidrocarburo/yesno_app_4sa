import 'package:flutter/material.dart';
import 'package:yesno_app_4sa/domain/entities/message.dart';

class HisMessageBubble extends StatelessWidget {
  final Message message;
  const HisMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Text(message.text, 
            style: TextStyle(color: Colors.white),),
          ),
        ),
        const SizedBox(height: 5),
        //siempre va a devolver una imagen [signo de admiración]
        _ImageBubble(imageUrl: message.imageUrl!),
        const SizedBox(height: 5),

        // Todo: imagen
      ],
    );
  }
}
class _ImageBubble extends StatelessWidget {

  final String imageUrl;

  const _ImageBubble({required this.imageUrl});
  
  @override
  Widget build(BuildContext context) {
   
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: const Text('El que te debe dinero está enviando una imagen'),
          );
        },
        ));
  }
}