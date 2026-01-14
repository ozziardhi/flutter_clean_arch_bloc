import 'package:cleanarch/features/profile/data/datasources/profiledatasource.dart';
import 'package:cleanarch/features/profile/data/models/profile.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Annotation which generates the cat.mocks.dart library and the MockCat class.
@GenerateNiceMocks([MockSpec<Profiledatasource>()])
import 'profiledatasource_test.mocks.dart';

Future<void> main() async {
  // Create mock object.
  var datasource = MockProfiledatasource();

  const int userId = 1;

  Profilemodel fakeprofilemodel = const Profilemodel(
    id: userId,
    email: 'ozziardhi@gmail.com',
    firstName: 'Ozzi',
    lastName: '$userId',
    avatarUrl: 'https://image.com/$userId',
  );

  test('profile remote data source - Berhasil', () async {
    when(datasource.getUser(userId)).thenAnswer((_) async => fakeprofilemodel);

    try {
      var response = await datasource.getUser(1);
      print(response.toJson());
    } catch (e) {
      print(e);
    }
  });

  test('profile remote data source - gagal', () async {
    when(datasource.getUser(userId)).thenThrow((Exception()));

    try {
      var response = await datasource.getUser(1);
      print(response.toJson());
    } catch (e) {
      print(e);
    }
  });
}
