class PhotoModel {
  final String assetId;
  final DateTime createdAt;

  PhotoModel({
    required this.assetId,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'asset_id': assetId,
      'created_at': createdAt.toIso8601String(),
    };
  }

  factory PhotoModel.fromMap(Map<String, dynamic> map) {
    return PhotoModel(
      assetId: map['asset_id'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  @override
  String toString() {
    return 'PhotoModel(assetId: $assetId, createdAt: $createdAt)';
  }
}