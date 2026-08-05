import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<bool> requestPhotoPermission() async {

    final status = await Permission.photos.request();

    debugPrint("권한 상태 = $status");

    return status.isGranted;
  }
}