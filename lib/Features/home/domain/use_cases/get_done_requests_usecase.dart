import 'package:aid_humanity/Features/home/domain/repositories/home_repository.dart';
import 'package:aid_humanity/core/entities/request_entity.dart';
import 'package:aid_humanity/core/error/faliures.dart';
import 'package:dartz/dartz.dart';

class GetDoneRequestsUseCase {
  final HomeRepository homeRepository;
  GetDoneRequestsUseCase({
    required this.homeRepository,
  });
  Future<Either<Failure, List<RequestEntity>>> call(
      String userId, bool isDonor) async {
    return homeRepository.getDoneRequests(userId, isDonor);
  }
}
