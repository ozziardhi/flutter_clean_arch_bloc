import 'package:cleanarch/features/profile/data/datasources/profiledatasource.dart';

void main() async {
  final ProfiledatasourceImplementation profiledatasourceImplementation =
      ProfiledatasourceImplementation();
  var response = await profiledatasourceImplementation.getalluser(1);

  for (var element in response) {
    print(element.toJson());
  }
}
