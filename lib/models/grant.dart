class GrantModel {
//  final String id;
  final String name;
  final String category;
  final String deadline;
  final String description;

  GrantModel({
   // required this.id,
    required this.name,
    required this.category,
    required this.deadline,
    required this.description,
  });

  toJson() => {
     //   "id": id,
        "name": name,
        "category": category,
        "deadline": deadline,
        "description": description,
      };

  factory GrantModel.fromJson(Map<String, dynamic> json) {
    return GrantModel(
      // id: json['id'],
      name: json['name'],
      category: json['category'],
      deadline: json['deadline'],
      description: json['description'],
    );
  }
}
