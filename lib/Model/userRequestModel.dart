class UserRequestModel {
  String? id;
  int? page;
  int? perPage;
  int? totalrecord;
  int? totalPages;
  List<UserModel>? data;

  UserRequestModel(
      {this.id,
      this.page,
      this.perPage,
      this.totalrecord,
      this.totalPages,
      this.data});

  UserRequestModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    page = json["page"];
    perPage = json["per_page"];
    totalrecord = json["totalrecord"];
    totalPages = json["total_pages"];
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => UserModel.fromJson(e)).toList();
  }

  static List<UserRequestModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => UserRequestModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["page"] = page;
    _data["per_page"] = perPage;
    _data["totalrecord"] = totalrecord;
    _data["total_pages"] = totalPages;
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  UserRequestModel copyWith({
    String? id,
    int? page,
    int? perPage,
    int? totalrecord,
    int? totalPages,
    List<UserModel>? data,
  }) =>
      UserRequestModel(
        id: id ?? this.id,
        page: page ?? this.page,
        perPage: perPage ?? this.perPage,
        totalrecord: totalrecord ?? this.totalrecord,
        totalPages: totalPages ?? this.totalPages,
        data: data ?? this.data,
      );
}

class UserModel {
  int? id;
  String? name;
  String? email;
  String? profilepicture;
  String? location;
  String? createdat;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.profilepicture,
      this.location,
      this.createdat});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    profilepicture = json["profilepicture"];
    location = json["location"];
    createdat = json["createdat"];
  }

  static List<UserModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => UserModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["profilepicture"] = profilepicture;
    _data["location"] = location;
    _data["createdat"] = createdat;
    return _data;
  }

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? profilepicture,
    String? location,
    String? createdat,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        profilepicture: profilepicture ?? this.profilepicture,
        location: location ?? this.location,
        createdat: createdat ?? this.createdat,
      );
}
