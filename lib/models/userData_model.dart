class userData_model {
  String? id;
  String? name;
  String? email;
  userData_model({this.id, this.email, this.name});
  userData_model.fromJson(Map<String, dynamic> json)
      : this(id: json['id'], name: json['name'], email: json['email']);
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email};
  }
}
