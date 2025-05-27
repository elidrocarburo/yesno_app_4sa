//punto intermedio antes de comunicarse con la aplicación

import 'dart:math';

import 'package:yesno_app_4sa/domain/entities/message.dart';

class YesNoModel {
    final String answer;
    final bool forced;
    final String image;

    YesNoModel({
        required this.answer,
        required this.forced,
        required this.image,
    });

    //factory sirve para crear una nueva instancia de la clase

    factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );

    Message toMessageEntity() {
  final responses = [
    Message(
      text: answer == 'yes' 
      ? 'Por supuesto' 
      : answer == 'no' 
        ? 'Negativo' 
        : 'Quizás',
      fromWho: FromWho.his,
      imageUrl: image,
      time: DateTime.now()
    ),
    Message(
      text: answer == 'yes' 
      ? 'Claro' 
      : answer == 'no' 
        ? 'Para nada' 
        : 'Posiblemente',
      fromWho: FromWho.his,
      imageUrl: image,
      time: DateTime.now()
    ),
    Message(
      text: answer == 'yes'  
        ? 'Claro que sí' 
        : answer == 'no' 
          ? 'No creo' 
          : 'Quizás',
      fromWho: FromWho.his,
      imageUrl: image,
      time: DateTime.now()
    ),
  ];

  //con la clase math del mismo dart, elegirá una de las respuestas al azar con la función Random
  //donde el índice serán las respuestas y las irá soltando de manera aleatoria
  final randomIndex = Random().nextInt(responses.length);
  return responses[randomIndex];
}
}