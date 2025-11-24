import 'package:cleanarch/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/profile.dart';

abstract class ProfileRepo {
  Future<Either<Failure, List<Profile>>> getAllUser(int page);
  Future<Either<Failure, Profile>> getUser(int id);
}
