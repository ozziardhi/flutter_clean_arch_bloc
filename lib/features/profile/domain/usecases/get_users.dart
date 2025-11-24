import 'package:cleanarch/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/profile.dart';
import '../repositories/profile_repo.dart';

class GetUsers {
  final ProfileRepo profileRepo;

  const GetUsers(this.profileRepo);

  Future<Either<Failure, Profile>> execute(int id) async {
    return await profileRepo.getUser(id);
  }
}
