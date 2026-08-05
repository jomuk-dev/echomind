class PhotoModel {
  final String assetId;
  final DateTime createdAt;

  PhotoModel({
    required this.assetId,
    required this.createdAt,
  });

  @override
  String toString() {
    return 'PhotoModel(assetId: $assetId, createdAt: $createdAt)';
  }
}