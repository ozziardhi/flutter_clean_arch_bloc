import 'package:cleanarch/features/profile/domain/entities/profile.dart';

class Profilemodel extends Profile {
  final String firstName;
  final String lastName;
  final String avatarUrl;

  const Profilemodel({
    required super.id,
    required this.firstName,
    required this.lastName,
    required super.email,
    required this.avatarUrl,
  }) : super(fullname: '$firstName $lastName', image: avatarUrl);

  // membuat fromjson map=>profilemodel
  factory Profilemodel.fromJson(Map<String, dynamic> json) {
    return Profilemodel(
      id: json['id'] as int,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      avatarUrl: json['avatar'] as String,
    );
  }

  // membuat tojson profilemodel=>map
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "firstname": firstName,
      "lastname": lastName,
      "avatar": avatarUrl,
    };
  }

  // list<map> => List<profilemodel>
  static List<Profilemodel> fromJsonList(List data) {
    if (data.isEmpty) return [];

    return data
        .whereType<Map<String, dynamic>>() // filter yang bener-bener Map
        .map((single) => Profilemodel.fromJson(single))
        .toList();
  }
}
// static List<Profilemodel> fromJsonList(List data) {
//     if (data.isEmpty) return [];
//     List<Profilemodel> allData = [];
//     data.map((singledata) => Profilemodel.fromJson(singledata)).toList();
//     return allData;
//   }