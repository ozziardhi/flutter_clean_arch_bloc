import 'package:cleanarch/features/profile/data/datasources/profiledatasource.dart';

void main() async {
  final ProfiledatasourceImplementation profiledatasourceImplementation =
      ProfiledatasourceImplementation();
  try {
    var response = await profiledatasourceImplementation.getUser(1);
    print(response.toJson());
  } catch (e) {
    print(e);
  }

  // untuk alluser
  // var response = await profiledatasourceImplementation.getalluser(2);

  // untuk alluser
  // for (var element in response) {
  //   print(element.toJson());
  // }
}
