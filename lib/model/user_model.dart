class UserModel {
  String name;
  String imageUrl;
  UserModel({
    required this.name,
    required this.imageUrl,
  });

  factory UserModel.fake() {
    return UserModel(name: 'Alpay Güroğlu', imageUrl: 'https://avatars.githubusercontent.com/u/63578350?v=4');
  }
}
