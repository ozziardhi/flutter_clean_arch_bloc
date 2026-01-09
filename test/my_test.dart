import 'package:cleanarch/features/profile/data/datasources/profiledatasource.dart';

void main() async {
  final ProfiledatasourceImplementation profiledatasourceImplementation =
      ProfiledatasourceImplementation();
  var response = await profiledatasourceImplementation.getUser(10);
  print(response.toJson());

  // untuk alluser
  // var response = await profiledatasourceImplementation.getalluser(2);

  // untuk alluser
  // for (var element in response) {
  //   print(element.toJson());
  // }
}
