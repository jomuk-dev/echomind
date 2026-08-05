import '../models/photo_model.dart';
import '../services/gallery_service.dart';

class IndexerService {
  final GalleryService galleryService = GalleryService();

  Future<List<PhotoModel>> scanGallery() async {
    final photos = await galleryService.getPhotos();

    return photos;
  }
}