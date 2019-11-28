import 'dart:io';

import 'package:dependencies/dependencies.dart';
import 'package:desmosdemo/sources/sources.dart';
import 'package:http/http.dart' as http;

class SourcesModule implements Module {
  final Future<Directory> Function() getDirectory;

  SourcesModule(this.getDirectory);

  @override
  void configure(Binder binder) {
    binder
      ..bindLazySingleton((injector, params) => LocalPostsSource(
            postsStorage: FileStorage(() async {
              final root = await getDirectory();
              return Directory('${root.path}/posts');
            }),
            likesStorage: FileStorage(() async {
              final root = await getDirectory();
              return Directory('${root.path}/likes');
            }),
          ))
      ..bindLazySingleton((injector, params) => RemotePostsSource(
            httpClient: http.Client(),
          ));
  }
}
