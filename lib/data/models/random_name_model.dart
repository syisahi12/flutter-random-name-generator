class RandomName {
  final String firstName;
  final String lastName;

  RandomName({required this.firstName, required this.lastName});

  factory RandomName.fromJson(Map<String, dynamic> json) {
    return RandomName(
      firstName: json['name']['first'],
      lastName: json['name']['last'],
    );
  }
}