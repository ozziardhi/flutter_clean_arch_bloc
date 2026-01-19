import 'package:cleanarch/features/profile/data/datasources/profiledatasource.dart';
import 'package:cleanarch/features/profile/data/models/profile.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Annotation which generates the cat.mocks.dart library and the MockCat class.
@GenerateNiceMocks([MockSpec<Profiledatasource>()])
import 'profiledatasource_test.mocks.dart';

Future<void> main() async {
  // Create mock object.
  var datasource = MockProfiledatasource();
  var datasourceImpl = ProfiledatasourceImplementation(client: Client());

  // === Test constants ===
  const int userId = 1;
  const int page = 1;
  const String baseUrl = 'https://reqres.in/api';

  // === Test URLs ===
  final Uri getUserUrl = Uri.parse('$baseUrl/users/$userId');
  final Uri getAllUserUrl = Uri.parse('$baseUrl/users?page=$page');

  // === Fake model ===
  final Profilemodel fakeprofilemodel = Profilemodel(
    id: userId,
    email: 'ozziardhi@gmail.com',
    firstName: 'Ozzi',
    lastName: '$userId',
    avatarUrl: 'https://image.com/$userId',
  );

  group('Profile Remote Data Source abstract Test ', () {
    group('getuser', () {
      test('Berhasil', () async {
        when(
          datasource.getUser(userId),
        ).thenAnswer((_) async => fakeprofilemodel);

        try {
          var response = await datasource.getUser(1);
          expect(response, isA<Profilemodel>());
        } catch (e) {
          fail("Tidak mungkin Error");
        }
      });

      test('gagal', () async {
        when(datasource.getUser(userId)).thenThrow((Exception()));

        try {
          await datasource.getUser(1);
          fail("Tidak Mungkin error");
        } catch (e) {
          expect(e, isException);
        }
      });
    });

    group('getalluser', () {
      test('Berhasil', () async {
        when(
          datasource.getalluser(page),
        ).thenAnswer((_) async => [fakeprofilemodel]);

        try {
          var response = await datasource.getalluser(page);
          expect(response, [fakeprofilemodel]);
        } catch (e) {
          fail("Tidak mungkin Error");
        }
      });

      test('gagal', () async {
        when(datasource.getalluser(page)).thenThrow((Exception()));

        try {
          await datasource.getalluser(page);
          fail("Tidak Mungkin error");
        } catch (e) {
          expect(e, isException);
        }
      });
    });
  });

  group('Profile Remote Data Source implementation Test ', () {});
}
