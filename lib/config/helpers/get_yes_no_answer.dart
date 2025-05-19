import 'package:dio/dio.dart';
import 'package:yesno_app_4sa/domain/entities/message.dart';
import 'package:yesno_app_4sa/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  // instancia de la clase Dio para manejar peticiones HTTP
  final _dio = Dio();

  Future<Message> getAnswer() async {
    // Almacenar el resultado de la petición
    final response = await _dio.get('https://yesno.wtf/api');

    // Almacenar la data de la respuesta
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    // Regresar la instancia de Message
    return yesNoModel.toMessageEntity();

  }
  
}
