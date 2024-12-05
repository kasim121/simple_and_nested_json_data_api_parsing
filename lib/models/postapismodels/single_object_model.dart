class PostRequest {
  final String foo;

  PostRequest({required this.foo});

  // Convert the model to a JSON map
  Map<String, dynamic> toJson() {
    return {'foo': foo};
  }
}

class PostResponse {
  final String id;
  final String foo;

  PostResponse({required this.id, required this.foo});

  // Create the model from a JSON map
  factory PostResponse.fromJson(Map<String, dynamic> json) {
    return PostResponse(
      id: json['id'],
      foo: json['foo'],
    );
  }
}
