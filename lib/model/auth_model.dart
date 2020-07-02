class AuthResponse {
    AuthResponse({
        this.error,
        this.msg,
        this.user,
    });

    final bool error;
    final String msg;
    final User user;

    factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        error: json["error"] == null ? null : json["error"],
        msg: json["msg"] == null ? null : json["msg"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "error": error == null ? null : error,
        "msg": msg == null ? null : msg,
        "user": user == null ? null : user.toJson(),
    };
}

class User {
    User({
        this.token,
        this.username,
    });

    final String token;
    final String username;

    factory User.fromJson(Map<String, dynamic> json) => User(
        token: json["token"] == null ? null : json["token"],
        username: json["username"] == null ? null : json["username"],
    );

    Map<String, dynamic> toJson() => {
        "token": token == null ? null : token,
        "username": username == null ? null : username,
    };
}




class AuthRequest {
    AuthRequest({
        this.username,
        this.password,
    });

    final String username;
    final String password;

    factory AuthRequest.fromJson(Map<String, dynamic> json) => AuthRequest(
        username: json["username"] == null ? null : json["username"],
        password: json["password"] == null ? null : json["password"],
    );

    Map<String, dynamic> toJson() => {
        "username": username == null ? null : username,
        "password": password == null ? null : password,
    };
}