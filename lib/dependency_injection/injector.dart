import 'package:dependencies/dependencies.dart' as di;
import 'package:desmosdemo/dependency_injection/export.dart';

/// Utility class used to provide instances of different objects.
class Injector {
  /// Initializes the injector. Should be called inside the main method.
  static init() {
    final builder = di.Injector.builder()..install(RepositoriesModule());
    final injector = builder.build();
    di.InjectorRegistry.instance.register(injector);
  }

  /// Returns the instance of the provided object having type [T].
  static T get<T>({String name}) {
    return di.InjectorRegistry.instance.get().get(name: name);
  }
}
