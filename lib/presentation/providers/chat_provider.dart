import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  //controlador que maneja la posicion del scroll
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [];

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) {
      return;
    }

    final newMessage = Message(text: text, fromWho: FromWho.me);
    //Agregar un nuevo mensaje a la lista
    messageList.add(newMessage);
    print('flutter: Cantidad de mensajes: ${messageList.length}');

    //Detectar si el usuario hizo una pregunta
    if (text.endsWith('?')) {
      herReply();
    }
    //Notifica a provider que algo cambió
    notifyListeners();
    moveScrollToBottom();
  }

  //Mover el scroll hasta abajo
  Future<void> moveScrollToBottom() async {
    //Animacion
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        //offset: posicion del maximo scroll posible,
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        //rebote de la animacion
        curve: Curves.easeOut);
  }

  //Crear la respuesta de ella
  Future<void> herReply() async {
    //Obtener el mensaje de la petición HTTP
    final herMessage = await getYesNoAnswer.getAnswer();

    //Añadimos el mensaje de ella a la lista de mensajes
    messageList.add(herMessage);

    //Notifica a provider que algo cambió
    notifyListeners();
    //Mover el scroll hasta abajo
    moveScrollToBottom();
  }
}
