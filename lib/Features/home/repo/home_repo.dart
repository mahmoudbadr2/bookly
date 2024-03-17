import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Faliure, List<BookModel>>> featchNewsSetBooks();
  Future<Either<Faliure, List<BookModel>>> featchFeaturedBooks();
}
