import 'package:dio/dio.dart';

class DioHelper{
  static Dio? _dio;
  static init() {
    _dio = Dio(
      BaseOptions(
          baseUrl: "https://api.themoviedb.org/3/",
          receiveDataWhenStatusError: true,
          responseType: ResponseType.json,
          headers: {
            'Content-Type': 'application/json',
          }),
    );
  }
//GET Method
   static Future<Response> getData({
    required url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    return _dio!.get(url, queryParameters: query);
  }
}