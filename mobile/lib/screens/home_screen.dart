import 'package:flutter/material.dart';
import '../services/permission_service.dart';
import '../services/gallery_service.dart';
import '../services/api_service.dart';
import '../indexer/indexer_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool photoPermission = false;
  int photoCount = 0;
  String apiStatus = "-";

  final permissionService = PermissionService();
  final galleryService = GalleryService();
  final indexerService = IndexerService();
  final apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EchoMind"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Icon(
                Icons.search,
                size: 80,
              ),
            ),

            const SizedBox(height: 20),

            const Center(
              child: Text(
                "EchoMind",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Center(
              child: Text(
                "AI 기반 개인 검색 엔진",
              ),
            ),

            const SizedBox(height: 50),

            const Text(
              "사진 접근 권한",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "사진 검색을 위해 권한이 필요합니다.",
            ),

            const SizedBox(height: 15),

            SwitchListTile(
              title: Text(photoPermission ? "허용됨" : "허용 안됨"),
              value: photoPermission,
              onChanged: (value) async {
                final granted =
                    await permissionService.requestPhotoPermission();

                if (granted) {
                  final count = await galleryService.getPhotoCount();
                  final photos = await indexerService.scanGallery();
                  final status = await apiService.getStatus();

                  setState(() {
                    photoPermission = true;
                    photoCount = count;
                    apiStatus = status;
                  });

                  debugPrint("PhotoModel 개수 : ${photos.length}");

                  if (photos.isNotEmpty) {
                    debugPrint(photos.first.toString());
                  }
                }
              },
            ),

            const SizedBox(height: 20),

            Center(
              child: Text(
                "사진 개수 : $photoCount장",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Center(
              child: Text(
                "API 상태 : $apiStatus",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("시작하기"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}