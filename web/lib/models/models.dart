class UserProfile {
  final String name;
  final String baptismalName;
  final String phone;
  UserProfile({required this.name, required this.baptismalName, required this.phone});
}

class MassInfo {
  final String title;
  final String time; // "2025-10-04 10:00"
  final String priest;
  final String location;
  final bool codeEnabled;
  MassInfo({required this.title, required this.time, required this.priest, required this.location, required this.codeEnabled});
}
