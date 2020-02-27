import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mooncake/dependency_injection/dependency_injection.dart';
import 'package:mooncake/ui/ui.dart';
import 'package:mooncake/usecases/usecases.dart';

/// BloC that controls the navigation to the different screens of the app.
class NavigatorBloc extends Bloc<NavigatorEvent, void> {
  final GlobalKey<NavigatorState> _navigatorKey = PostsKeys.navigatorKey;
  final CheckLoginUseCase _checkLoginUseCase;

  NavigatorBloc({
    @required CheckLoginUseCase checkLoginUseCase,
  })  : assert(checkLoginUseCase != null),
        _checkLoginUseCase = checkLoginUseCase;

  factory NavigatorBloc.create() {
    return NavigatorBloc(
      checkLoginUseCase: Injector.get(),
    );
  }

  @override
  void get initialState => null;

  @override
  Stream<void> mapEventToState(NavigatorEvent event) async* {
    if (event is NavigateToHome) {
      _mapNavigateToHomeEventToState();
    } else if (event is NavigateToRecoverAccount) {
      _mapNavigateToRecoverAccountEventToState(event);
    } else if (event is NavigateToCreateAccount) {
      _mapNavigateToCreateAccountEventToState();
    } else if (event is NavigateToPostDetails) {
      _mapNavigateToPostDetailsEventToState(event);
    }
  }

  void _mapNavigateToHomeEventToState() {
    _navigatorKey.currentState.pushNamedAndRemoveUntil(
      PostsRoutes.home,
      (_) => false,
    );
  }

  void _mapNavigateToRecoverAccountEventToState(
    NavigateToRecoverAccount event,
  ) {
    _navigatorKey.currentState.pushNamed(
      PostsRoutes.recoverAccount,
      arguments: event.args,
    );
  }

  void _mapNavigateToCreateAccountEventToState() {
    _navigatorKey.currentState.pushNamed(PostsRoutes.createAccount);
  }

  void _mapNavigateToPostDetailsEventToState(
    NavigateToPostDetails event,
  ) async {
    final isLoggedIn = await _checkLoginUseCase.isLoggedIn();
    if (isLoggedIn) {
      _navigatorKey.currentState.push(MaterialPageRoute(
        builder: (context) => PostDetailsScreen(postId: event.postId),
      ));
    }
  }
}
