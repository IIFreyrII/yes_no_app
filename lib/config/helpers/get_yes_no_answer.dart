import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class GetYesNoAnswer {
  //Instantiate the Dio class para manejar peticiones HTTP
  final _dio = Dio();

  Future<Message> getAnswer ()async{
    //Almacenar la petición
    final response = await _dio.get('https://yesno.wtf/api');
  }
}
