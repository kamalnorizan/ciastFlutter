
class LoginModel {
    int? code;
    String? message;
    Data? data;

    LoginModel({this.code, this.message, this.data});

    LoginModel.fromJson(Map<String, dynamic> json) {
        code = json["code"];
        message = json["message"];
        data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }

    static List<LoginModel> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => LoginModel.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["code"] = code;
        _data["message"] = message;
        if(data != null) {
            _data["data"] = data?.toJson();
        }
        return _data;
    }

    LoginModel copyWith({
        int? code,
        String? message,
        Data? data,
    }) => LoginModel(
        code: code ?? this.code,
        message: message ?? this.message,
        data: data ?? this.data,
    );
}

class Data {
    int? id;
    String? name;
    String? email;
    String? token;

    Data({this.id, this.name, this.email, this.token});

    Data.fromJson(Map<String, dynamic> json) {
        id = json["Id"];
        name = json["Name"];
        email = json["Email"];
        token = json["Token"];
    }

    static List<Data> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Data.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["Id"] = id;
        _data["Name"] = name;
        _data["Email"] = email;
        _data["Token"] = token;
        return _data;
    }

    Data copyWith({
        int? id,
        String? name,
        String? email,
        String? token,
    }) => Data(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        token: token ?? this.token,
    );
}