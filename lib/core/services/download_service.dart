import 'dart:async';

import 'package:download_manager/download_manager.dart';
import 'package:flutter/services.dart';
import 'package:harpy/core/core.dart';

class DownloadService with HarpyLogger {
  const DownloadService();

  Future<void> download({
    required String url,
    required String name,
    required String path,
  }) async {
    try {
      log.fine('downloading $url');

      await DownloadManager.enqueue(
        url: url,
        path: path,
        name: name,
      );

      HapticFeedback.lightImpact().ignore();
    } catch (e, st) {
      log.severe('error while trying to download file', e, st);
    }
  }
}
