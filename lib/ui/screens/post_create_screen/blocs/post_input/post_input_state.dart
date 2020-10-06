import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mooncake/entities/entities.dart';
import 'package:mooncake/entities/posts/polls/post_game.dart';

/// Represents the current state of a [CommentForm] while the user
/// is creating a new comment for a post.
@immutable
class PostInputState extends Equatable {
  final Post parentPost;

  final String message;
  final bool allowsComments;
  final List<PostMedia> medias;
  final PostPoll poll;
  final PostGame game;

  final bool showPopup;
  final bool saving;
  final bool willShowPopupAgain;

  PostInputState(
      {@required this.parentPost,
      @required this.message,
      @required this.allowsComments,
      @required this.medias,
      @required this.poll,
      @required this.saving,
      @required this.showPopup,
      @required this.willShowPopupAgain,
      this.game});

  bool get isValid {
    return message?.trim()?.isNotEmpty == true ||
        medias?.isNotEmpty == true ||
        _isPollValid;
  }

  bool get hasPoll {
    return poll != null;
  }

  bool get hasGame => game != null;

  bool get _isPollValid {
    return poll != null &&
        // The question must not be empty
        poll.question.trim().isNotEmpty &&
        // There have to be at least 2 options
        poll.options
                .where((element) => element.text.trim().isNotEmpty)
                .length >=
            2;
  }

  /// Builds an empty state.
  factory PostInputState.empty(Post parentPost) {
    return PostInputState(
      parentPost: parentPost,
      message: null,
      allowsComments: true,
      medias: [],
      poll: null,
      saving: false,
      showPopup: false,
      willShowPopupAgain: true,
    );
  }

  // Removes poll state
  PostInputState removePoll() {
    return PostInputState(
        parentPost: parentPost,
        message: message,
        allowsComments: allowsComments,
        medias: medias,
        poll: null,
        saving: saving,
        showPopup: showPopup,
        willShowPopupAgain: willShowPopupAgain,
        game: null);
  }

  // Removes poll state
  PostInputState removeGame() {
    return PostInputState(
        parentPost: parentPost,
        message: message,
        allowsComments: allowsComments,
        medias: medias,
        poll: null,
        saving: saving,
        showPopup: showPopup,
        willShowPopupAgain: willShowPopupAgain,
        game: null);
  }

  /// Updates this state setting the specified values properly.
  PostInputState copyWith({
    String message,
    bool allowsComments,
    List<PostMedia> medias,
    PostPoll poll,
    PostGame game,
    bool showPopup,
    bool saving,
    bool willShowPopupAgain,
  }) {
    if (poll != null) {
      game = null;
    }
    if (game != null) {
      poll = null;
    }
    return PostInputState(
      parentPost: parentPost,
      message: message ?? this.message,
      allowsComments: allowsComments ?? this.allowsComments,
      saving: saving ?? this.saving,
      medias: medias ?? this.medias,
      poll: poll, //?? this.poll,
      game: game, //?? this.game,
      showPopup: showPopup ?? this.showPopup,
      willShowPopupAgain: willShowPopupAgain ?? this.willShowPopupAgain,
    );
  }

  @override
  List<Object> get props => [
        parentPost,
        message,
        allowsComments,
        medias,
        poll,
        game,
        saving,
        showPopup,
        willShowPopupAgain,
      ];

  @override
  String toString() {
    return 'PostInputState { '
        'parentPost: $parentPost, '
        'message: $message, '
        'allowsComments: $allowsComments, '
        'medias: $medias, '
        'poll: $poll, '
        'saving: $saving, '
        'showPopup: $showPopup, '
        'willShowPopupAgain: $willShowPopupAgain, '
        '}';
  }
}
