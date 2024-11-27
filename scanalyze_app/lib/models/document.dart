class Document {
  final String id;
  final String title;
  final String description;
  final String url;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  Document({
    required this.id,
    required this.title,
    required this.description,
    required this.url,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] != null ? DateTime.parse(json['deleted_at']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'url': url,
    'status': status,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
    'deleted_at': deletedAt?.toIso8601String(),
  };
}

class CountStatusDocument {
  final String status;
  final int count;

  CountStatusDocument({
    required this.status,
    required this.count,
  });

  factory CountStatusDocument.fromJson(Map<String, dynamic> json) {
    return CountStatusDocument(
      status: json['status'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'count': count,
  };
}