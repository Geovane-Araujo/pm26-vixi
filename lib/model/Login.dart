class Login {
  String? user;
  String? password;

  Login({this.user, this.password});

  Login.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['password'] = this.password;
    return data;
  }
}