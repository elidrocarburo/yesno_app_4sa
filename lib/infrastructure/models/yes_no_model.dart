//punto intermedio antes de comunicarse con la aplicación

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

    Message toMessageEntity() => Message(
      text: answer == 'yes' 
      ? 'Sí'
      : answer == 'no'
        ? 'No'
        : 'Tal vez',
      fromWho: FromWho.his,
      imageUrl: image
    );
    
  
}