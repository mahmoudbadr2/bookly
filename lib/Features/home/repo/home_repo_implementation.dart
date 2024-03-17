import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/repo/home_repo.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<Faliure, List<BookModel>>> featchNewsSetBooks() async {
    try {
      var data = await apiService.get(
          endpoint:
              'volumes?Filtering=free-ebooks&Sorting=newset&q=subject:Programming');
      List<BookModel> books = [];
      for (var items in data['items']) {
        books.add(BookModel.fromJson(items));
      }
      return right(books);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Faliure, List<BookModel>>> featchFeaturedBooks() {
    // TODO: implement featureFeatureBooks
    throw UnimplementedError();
  }
}
