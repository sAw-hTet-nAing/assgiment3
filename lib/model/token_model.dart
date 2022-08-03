import 'dart:convert';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
  final String tokenType;
  final String accessToken;

  Token({
    required this.tokenType,
    required this.accessToken,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        tokenType: json["token_type"],
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "token_type": tokenType,
        "access_token": accessToken,
      };
}
