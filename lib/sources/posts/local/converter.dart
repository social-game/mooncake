import 'package:flutter/foundation.dart';
import 'package:mooncake/entities/entities.dart';
import 'package:sembast/sembast.dart';

/// Allows to easily (de)serialize any post of list of posts asynchronously
/// running the conversion on another isolate to improve the efficiency.
class PostsConverter {
  /// Serializes the given [post] to a [Map].
  static Future<Map<String, dynamic>> serializePost(Post post) {
    return compute<Post, Map<String, dynamic>>(Post.asJson, post);
  }

  static List<Map<String, dynamic>> _serializeList(List<Post> posts) {
    return List.generate(
      posts.length,
      (index) => posts[index].toJson(),
    );
  }

  /// Serializes the given list of [posts] into a list of [Map] objects.
  static Future<List<Map<String, dynamic>>> serializePosts(List<Post> posts) {
    return compute(_serializeList, posts);
  }

  /// Deserializes a post reading its value from the given [record].
  /// Such record can be either a [RecordSnapshot] or a `Map<String, dynamic>`.
  static Future<Post> deserializePost(dynamic record) {
    if (record == null) return null;
    final value = (record is RecordSnapshot) ? record.value : record;
    return compute<Map<String, dynamic>, Post>(Post.fromJson, value);
  }

  static List<Post> _deserializeList(List<dynamic> records) {
    return records.map((snapshot) {
      final value = snapshot is RecordSnapshot ? snapshot.value : snapshot;
      return value == null ? (value as Post) : Post.fromJson(value);
    }).toList();
  }

  /// Deserializes the given [records] into a list of [Post] objects.
  /// Each object inside the given [records] list can be either a
  /// [RecordSnapshot] or a `Map<String, dynamic>`.
  static Future<List<Post>> deserializePosts(List<dynamic> records) async {
    return compute(_deserializeList, records);
  }
}
