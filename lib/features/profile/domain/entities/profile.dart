import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final int id;
  final String fullname;

  final String email;
  final String image;

  const Profile({
    required this.id,
    required this.fullname,

    required this.email,
    required this.image,
  });

  @override
  List<Object?> get props => [id, fullname, email, image];
}
