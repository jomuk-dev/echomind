import 'package:flutter/foundation.dart';
import 'package:photo_manager/photo_manager.dart';
import '../models/photo_model.dart';

class GalleryService {
  Future<int> getPhotoCount() async {
    final albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
    );

    debugPrint("앨범 개수 : ${albums.length}");

    for (final album in albums) {
      debugPrint("${album.name} : ${await album.assetCountAsync}");
    }

    int total = 0;

    for (final album in albums) {
      total += await album.assetCountAsync;
    }

    debugPrint("총 사진 : $total");

    return total;
  }

  Future<List<PhotoModel>> getPhotos() async {
    final albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
    );

    List<PhotoModel> photos = [];

    for (final album in albums) {
      final assets = await album.getAssetListPaged(
        page: 0,
        size: 100000,
      );

      for (final asset in assets) {
        photos.add(
          PhotoModel(
            assetId: asset.id,
            createdAt: asset.createDateTime,
          ),
        );
      }
    }

    return photos;
  }
}