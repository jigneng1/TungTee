class UserModel {
  final String userId;
  final String fullname; // 3-70 char
  final String nickname; // 3-20 char
  final String email;
  final String phone;
  final String gender; // female, male, others
  final DateTime birthDate; // 2 options: 1.below 18 2. above 18
  final List<String> interests; // maximum 5
  final List<String> createdEvents;
  final List<String> joinedEvents;
  final int behaviorPoint;

  UserModel({
    required this.userId,
    required this.fullname,
    required this.nickname,
    required this.email,
    required this.phone,
    required this.gender,
    required this.birthDate,
    required this.interests,
    required this.createdEvents,
    required this.joinedEvents,
    required this.behaviorPoint,
  });

  Map<String, dynamic> toJSON() {
    return {
      'userId': userId,
      'fullname': fullname,
      'nickname': nickname,
      'email': email,
      'phone': phone,
      'gender': gender,
      'birthDate': birthDate.toIso8601String(),
      'interests': interests,
      'createdEvents': createdEvents,
      'joinedEvents': joinedEvents,
      'behaviorPoint': behaviorPoint,
    };
  }

  factory UserModel.fromJSON(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      fullname: json['fullname'],
      nickname: json['nickname'],
      email: json['email'],
      phone: json['phone'],
      gender: json['gender'],
      birthDate: DateTime.parse(json['birthDate']),
      interests: List<String>.from(json['interests']),
      createdEvents: List<String>.from(json['createdEvents']),
      joinedEvents: List<String>.from(json['joinedEvents']),
      behaviorPoint: json['behaviorPoint'],
    );
  }
}
