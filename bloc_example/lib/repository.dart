import 'package:dio/dio.dart' show Dio, DioError, DioErrorType;
import 'package:dio/dio.dart';

Future<dynamic> fetchUsers(String url) async {
  var watch = Stopwatch()..start();
  return await Dio().get(url)
  .then((response) {
    if(response.statusCode == 200 || response.statusCode == 304)
      return response.data;
  })
  .catchError((error) {
    print(error);
    throw DioError(error: error, type: DioErrorType.RESPONSE);
  })
  .timeout(Duration(milliseconds: 3000), onTimeout: () => throw DioError(error: 'Timeout occured.', type: DioErrorType.RECEIVE_TIMEOUT))
  .whenComplete(() {
    print(watch.elapsedMilliseconds);
  });
}