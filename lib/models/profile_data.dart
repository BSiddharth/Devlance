class ProfileData {
  final String gender;
  final String firstName;
  final String lastName;
  final String address;
  final String email;
  final String dob;
  final String cellNumber;
  final String pictureLink;

  ProfileData(
      {required this.gender,
      required this.firstName,
      required this.lastName,
      required this.address,
      required this.email,
      required this.dob,
      required this.cellNumber,
      required this.pictureLink});

  // results -> (gender, name -> (first, last), location -> ( street -> (number, name), city, state, country), email, dob -> (date, age), cell , picture -> (large, medium, thumbnail) )

  factory ProfileData.fromJson(Map<String, dynamic> data) {
    final String gender = data['gender'][0].toUpperCase() +
        data['gender'].substring(1).toLowerCase() as String;

    final String firstName = data['name']['first'] as String;
    final String lastName = data['name']['last'] as String;
    final String address = data['location']['street']['number'].toString() +
        ', ' +
        data['location']['street']['name'] +
        ', ' +
        data['location']['city'] +
        ', ' +
        data['location']['state'] +
        ', ' +
        data['location']['country'];
    final String email = data['email'] as String;
    final String dob = data['dob']['date'].substring(0, 10) as String;
    final String cellNumber = data['cell'] as String;
    final String pictureLink = data['picture']['large'] as String;

    return ProfileData(
        firstName: firstName,
        lastName: lastName,
        gender: gender,
        address: address,
        email: email,
        dob: dob,
        cellNumber: cellNumber,
        pictureLink: pictureLink);
  }
}
