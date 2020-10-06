import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mooncake/ui/ui.dart';
import 'package:mooncake/ui/screens/post_create_screen/blocs/export.dart';

/// Represents the top bar that is displayed to the user inside the
/// screen used to create a new post. It contains all the actions that
/// allow the user to either cancel the post, or send it.
class CreatePostTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostInputBloc, PostInputState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(8),
          child: AppBar(
            leading: FlatButton(
              padding: EdgeInsets.zero,
              child: Text(
                // Cancel按钮
                PostsLocalizations.of(context)
                    .translate(Messages.createPostCancelButton),
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Theme.of(context).appBarTheme.iconTheme.color,
                    ),
              ),
              onPressed: () => Navigator.of(context).pop(), // 弹出框
            ),
            actions: <Widget>[
              SizedBox(
                width: 65,
                child: PrimaryButton(
                  enabled: state.isValid,
                  child: Text(
                    // Post按钮
                    PostsLocalizations.of(context)
                        .translate(Messages.createPostCreateButton),
                  ),
                  borderRadius: 25,
                  onPressed: () {
                    BlocProvider.of<PostInputBloc>(context)
                        .add(SavePost()); //输入消息
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
