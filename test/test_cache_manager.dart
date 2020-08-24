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
}
