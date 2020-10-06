import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mooncake/entities/entities.dart';
import 'package:mooncake/ui/screens/post_create_screen/widgets/create_post_content/widgets/post_poll_creator/utils/common.dart';
import 'package:mooncake/ui/ui.dart';
import 'package:mooncake/ui/screens/post_create_screen/blocs/export.dart';

class GameOptionEditor extends StatefulWidget {
  final PollOption option;
  GameOptionEditor({Key key, this.option}) : super(key: key);

  @override
  _GameOptionEditorState createState() => _GameOptionEditorState();
}

class _GameOptionEditorState extends State<GameOptionEditor> {
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final hintText =
    //    '${PostsLocalizations.of(context).translate(Messages.pollOptionHint)} ${widget.option.id + 1}';

    if (widget.option.text != _textEditingController.text) {
      _textEditingController.text = widget.option.text;
    }

    String hintText2;
    if (widget.option.id == 0) {
      hintText2 = 'Yes';
      _textEditingController.text = 'YES';
    } else if (widget.option.id == 1) {
      hintText2 = 'No';
      _textEditingController.text = 'NO';
    } else {
      hintText2 = '';
    }

    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: getInputOutline(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _textEditingController,
                            keyboardType: TextInputType.text,
                            decoration: getInputDecoration(context, hintText2),
                            textCapitalization: TextCapitalization.sentences,
                            enabled: true, //是否禁用
                            onChanged: (value) =>
                                _onTextChanged(context, value),
                          ),
                        ),
                        // TODO: Implement the association of an image to a poll option
                        // IconButton(
                        //   icon: const Icon(MooncakeIcons.picture),
                        //   onPressed: () {},
                        // ),
                      ],
                    ),
                  ),
                ),
                if (widget.option.id > 1)
                  Container(
                    child: IconButton(
                      icon: const Icon(MooncakeIcons.delete),
                      tooltip: PostsLocalizations.of(context)
                          .translate(Messages.pollDeleteOptionHint),
                      onPressed: () => _deleteOption(context),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          width: 0.5,
                          color: Theme.of(context).colorScheme.onError,
                        ),
                      ),
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onTextChanged(BuildContext context, String value) {
    BlocProvider.of<PostInputBloc>(context)
        .add(UpdateGameOption(widget.option.id, value));
  }

  void _deleteOption(BuildContext context) {
    BlocProvider.of<PostInputBloc>(context)
        .add(DeleteGameOption(widget.option.id));
  }
}
