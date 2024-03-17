import 'package:dio/dio.dart';

abstract class Faliure {
  final String errMessage;

  Faliure(this.errMessage);
}

class ServerFailure extends Faliure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioExeption(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with apiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout with apiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('SendTimeout Timeout with apiServer');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure('Resquest to api is canceled');

      case DioExceptionType.badCertificate:
        return ServerFailure('Unknow failure');

      case DioExceptionType.connectionError:
        return ServerFailure('Bad connection');

      case DioExceptionType.unknown:
        return ServerFailure('Unknow failure');
      default:
        return ServerFailure('Unknow failure');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found , pls try again');
    } else if (ServerFailure == 500) {
      return ServerFailure('Internal Server error, pls try again');
    } else {
      return ServerFailure('Oops there was an Error, pls try later');
    }
  }
}
