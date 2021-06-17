class DogFactModel {
  String factId;
  List<String> facts;
  bool success;

  DogFactModel({this.factId, this.facts, this.success});

  @override
  String toString() {
    return 'DogFactModel{factId: $factId, factText: $facts, success: $success}';
  }

  factory DogFactModel.fromJson(Map<String, dynamic> json, String id) => DogFactModel(
    factId: id,
    facts: json["facts"] == null ? null : List<String>.from(json["facts"].map((x) => x)),
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "facts": facts == null ? null : List<dynamic>.from(facts.map((x) => x)),
    "success": success == null ? null : success,
  };


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DogFactModel &&
          runtimeType == other.runtimeType &&
          factId == other.factId &&
          facts == other.facts &&
          success == other.success;

  @override
  int get hashCode => factId.hashCode ^ facts.hashCode ^ success.hashCode;
}