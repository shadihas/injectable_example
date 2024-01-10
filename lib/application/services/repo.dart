import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:injectable_example/application/services/api_consumer.dart';

abstract class Repository{
  Future<Either<String, int>> getFakeInt();
}


@Singleton(as: Repository)
class RepositoryImp implements Repository{
  final ApiConsumer apiConsumer;
  RepositoryImp(this.apiConsumer);

   @override
  Future<Either<String, int>> getFakeInt() async {
    int response = await apiConsumer.getRequest("fakeUrl");
    try {
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
