import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/repo/home_repo.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Faliure, List<BookModel>>> featureBestSellerBooks() {
    // TODO: implement featureBestSellerBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Faliure, List<BookModel>>> featureFeatureBooks() {
    // TODO: implement featureFeatureBooks
    throw UnimplementedError();
  }
}
