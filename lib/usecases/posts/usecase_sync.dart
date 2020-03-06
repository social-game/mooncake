import 'package:meta/meta.dart';
import 'package:mooncake/entities/entities.dart';
import 'package:mooncake/usecases/posts/posts.dart';
import 'package:mooncake/usecases/usecases.dart';

/// Allows to sync all the posts that have been created offline as well as
/// all the likes and unlikes that have been set to posts.
class SyncPostsUseCase {
  final PostsRepository _postsRepository;

  SyncPostsUseCase({
    @required PostsRepository postsRepository,
  })  : assert(postsRepository != null),
        _postsRepository = postsRepository;

  /// Syncs the locally stored data to the chain.
  Future<void> sync() => _postsRepository.syncPosts();
}
