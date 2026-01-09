import 'package:hive/hive.dart';

import '../models/profile.dart';

abstract class Profiledatasourcelocal {
  Future<Profilemodel> getUser(int id);
  Future<List<Profilemodel>> getalluser(int page);
}

class ProfiledatasourceImplementation extends Profiledatasourcelocal {
  final HiveInterface hive;

  ProfiledatasourceImplementation({required this.hive});
  @override
  Future<Profilemodel> getUser(int id) async {
    var box = hive.box('profileBox');
    return box.get('getuser');
  }

  @override
  Future<List<Profilemodel>> getalluser(int page) async {
    var box = hive.box('profileBox');
    return box.get('getalluser');
  }
}
