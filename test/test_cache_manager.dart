import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_cache_manager/src/cache_store.dart';
import 'package:flutter_cache_manager/src/storage/non_storing_object_provider.dart';

class TestCacheManager extends BaseCacheManager {
  TestCacheManager()
      : super(
          null,
          cacheStore: CacheStore(
            Future.value(null),
            null,
            null,
            null,
            cacheRepoProvider: Future.value(NonStoringObjectProvider()),
          ),
        );

  @override
  Future<String> getFilePath() async {
    return null;
  }

  // TODO https://github.com/flutter/flutter/issues/20907
  String _fixPath(String path) {
    return Directory.current.path.endsWith('test')
        ? path.replaceFirst('test/', '')
        : path;
  }

  @override
  Stream<FileResponse> getFileStream(String url,
      {Map<String, String> headers, bool withProgress}) async* {
    if (url == 'https://placekitten.com/1024/768') {
      yield FileInfo(
        File(_fixPath('test/assets/768.jpg')),
        FileSource.Cache,
        DateTime(2050),
        url,
      );
    }
  }
}
