enum FromWho {me, his} //mensajes míos o de la otra persona
//lista de valores que no va a cambiar
//se procesa más rápido datos de enumeración

//identidad atómica: la unidad más pequeña
class Message{
  final String text;
  final String? imageUrl; //puede o no darse
  final FromWho fromWho; //quién mandará el mensaje (si yo o alguien más)
  final DateTime time;

  Message({
    required this.text, 
    this.imageUrl, //no nos pedirá mandar una imagen cuando le preguntemos algo a la otra persona
    required this.fromWho,
    required this.time
    }); 

}