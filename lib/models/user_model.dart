class User {
  String email;
  String name;
  String phone;
  String password;

  User({this.email, this.password, this.name, this.phone});

  User.from({this.password, this.email});

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'phone' : phone
      };

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        password = json['password'],
        email = json['email'],
        phone = json['phone'];
}
