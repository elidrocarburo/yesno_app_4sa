import 'package:flutter/material.dart';

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
            title: Text('kamui narushi in your area'),
            centerTitle: false,
        ),
        body: _ChatView(), // va a ser un widget privado
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea( //sirve para acomodar elementos de la app que puedan interferir con partes del sistema operativo
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
            children: [
                Expanded( //listview: lista que permite scroll de widgets que se alinean de forma vertical
                    child: ListView.builder(
                    itemCount: 100,
                    itemBuilder:(context, index) {
                      return Text('Indice: $index');
                    },) //tener lista de elementos que se van a construir apenas/ya hayan/estén en pantalla, los demás elementos desaparecen
                ),
        
        
                Text('idk')
            ],
        ),
      ),
    );
  }
}