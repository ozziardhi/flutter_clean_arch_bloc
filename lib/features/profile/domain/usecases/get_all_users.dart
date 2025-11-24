import 'package:cleanarch/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/profile.dart';
import '../repositories/profile_repo.dart';

class GetAllUsers {
  final ProfileRepo profileRepo;

  const GetAllUsers(this.profileRepo);

  Future<Either<Failure, List<Profile>>> execute(int page) async {
    return await profileRepo.getAllUser(page);
  }
}
