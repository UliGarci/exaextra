class UserModel{
  final int? id;
  final int userId;
  final String title;
  final String body;

  UserModel({this.id, required this.userId, required this.title, required this.body});

  factory UserModel.fromJson(Map<String,dynamic>json){
    return UserModel(id:json['id'],userId:json['userId'], title: json['title'], body:json['body']);
  }

  Map<String,dynamic>toJson(){
    return{
      'id':id,
      'userId':userId,
      'title':title,
      'body':body
    };
  }
}