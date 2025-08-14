class Masseges {
  final String massege;

  String email;
  Masseges({required this.massege, required this.email});

  factory Masseges.fromjson(jsonData) {
    return Masseges(massege: jsonData['massege'], email: jsonData['email']);
  }
}
