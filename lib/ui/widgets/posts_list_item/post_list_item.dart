import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mooncake/entities/entities.dart';
import 'package:mooncake/ui/ui.dart';

import 'action_bar/export.dart';
import 'reactions/post_reactions_list.dart';
import 'popups/export.dart';

/// Represents a single entry inside a list of [Post] objects.
/// It is made of the following components:
/// - a [AccountAvatar] object, containing the avatar of the post creator.
/// - a [PostItemHeader] object containing information such as the post
///    creator's username, his address and the creation date
/// - a [Text] containing the actual post message
/// - a [PostActionBar] containing all the actions that can be performed
///    for such post
class PostListItem extends StatelessWidget {
  final Post post;
  PostListItem({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).cardColor;
    if (post.status.value != PostStatusValue.TX_SUCCESSFULL) {
      color = color.withOpacity(0.5);
    }

    if (post.status.value == PostStatusValue.ERRORED) {
      color = Theme.of(context).errorColor.withOpacity(0.75);
    }

    return Container(
      margin: EdgeInsets.all(8),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(4.0),
        child: InkWell(
          onTap: () => _openPostDetails(context),
          onLongPress: _handleLongClick(context),
          child: Container(
            padding: PostsTheme.postItemPadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                PostContent(post: post),
                const SizedBox(height: ThemeSpaces.postItemSectionsSpacer),
                PostActionsBar(post: post),
                if (post.reactions.isNotEmpty)
                  const SizedBox(height: ThemeSpaces.postItemSectionsSpacer),
                if (post.reactions.isNotEmpty) PostReactionsList(post: post),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openPostDetails(BuildContext context) {
    BlocProvider.of<NavigatorBloc>(context)
        .add(NavigateToPostDetails(context, post.id));
  }

  Function _handleLongClick(BuildContext context) {
    if (post.status.hasError) {
      return () => showPostItemPopup(
            context: context,
            content: PostErrorPopupContent(error: post.status.data),
          );
    } else if (post.status.hasTxHash) {
      return () => showPostItemPopup(
            context: context,
            content: PostSuccessPopupContent(txHash: post.status.data),
          );
    }
    return null;
  }
}