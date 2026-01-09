import 'package:cleanarch/features/profile/data/datasources/localprofiledatasource.dart';
import 'package:cleanarch/features/profile/data/datasources/profiledatasource.dart';
import 'package:cleanarch/features/profile/data/models/profile.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repo.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ProfileRepositryImplementation extends ProfileRepo {
  final Profiledatasource profiledatasource;
  final Profiledatasourcelocal locaprofiledatasource;
  final HiveInterface hive;

  ProfileRepositryImplementation({
    required this.profiledatasource,
    required this.locaprofiledatasource,
    required this.hive,
  });

  @override
  Future<Either<Failure, List<Profile>>> getAllUser(int page) async {
    try {
      final List<ConnectivityResult> connectivityResult = await (Connectivity()
          .checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        // No available network types
        List<Profilemodel> hasil = await locaprofiledatasource.getalluser(page);
        return right(hasil);
      } else {
        // available network types
        List<Profilemodel> hasil = await profiledatasource.getalluser(page);
        var box = hive.box('profileBox');
        box.put("getalluser", hasil);
        return right(hasil);
        // kasih data terakhir ke local data source
      }
    } catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, Profile>> getUser(int id) async {
    try {
      final List<ConnectivityResult> connectivityResult = await (Connectivity()
          .checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        // No available network types
        Profilemodel hasil = await locaprofiledatasource.getUser(id);
        return right(hasil);
      } else {
        // available network types
        Profilemodel hasil = await profiledatasource.getUser(id);
        var box = hive.box('profileBox');
        box.put("getuser", hasil);
        return right(hasil);
        // kasih data terakhir ke local data source
      }
    } catch (e) {
      return left(Failure());
    }
  }
}
