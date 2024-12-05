/*
2. Single Object
https://jsonplaceholder.typicode.com/posts/1

{
  "userId": 1,
  "id": 1,
  "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
}
*/
class SingleObjectModelPost {
  final int userId;
  final int id;
  final String title;
  final String body;

  // Constructor
  SingleObjectModelPost(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  // Factory constructor to create a Post object from JSON
  factory SingleObjectModelPost.fromJson(Map<String, dynamic> json) {
    return SingleObjectModelPost(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
