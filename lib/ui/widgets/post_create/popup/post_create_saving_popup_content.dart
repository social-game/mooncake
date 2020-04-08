import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mooncake/ui/ui.dart';

/// Represents the popup that is showed to the user once he saves the post.
class PostSavingPopupContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostInputBloc, PostInputState>(
        builder: (BuildContext context, PostInputState state) {
      return Column(
        children: <Widget>[
          Icon(
            MooncakeIcons.syncing,
            color: Theme.of(context).accentColor,
            size: 80,
          ),
          const SizedBox(height: 20),
          Text(
            PostsLocalizations.of(context).savingPostPopupBody,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Row(
            children: <Widget>[
              Checkbox(
                value: !state.willShowPopupAgain,
                onChanged: (value) {
                  BlocProvider.of<PostInputBloc>(context)
                      .add(ChangeWillShowPopup());
                },
              ),
              Text(PostsLocalizations.of(context).savingPostPopupDontShow)
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: PrimaryRoundedButton(
                  onPressed: () {
                    BlocProvider.of<PostInputBloc>(context).add(CreatePost());
                  },
                  text: PostsLocalizations.of(context).savingPostPopupOkButton,
                ),
              ),
            ],
          )
        ],
      );
    });
  }
}
