class ContactModel {
  String name;
  String email;
  String? photo;
  String? phoneNumber;

  ContactModel({
    required this.name,
    required this.email,
    this.photo,
    required this.phoneNumber,
  });
}
