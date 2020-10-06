import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mooncake/ui/localization/index.dart';
import 'package:mooncake/ui/localization/messages/index.dart';
import 'package:mooncake/ui/screens/post_create_screen/blocs/export.dart';
import 'package:mooncake/ui/screens/post_create_screen/widgets/create_post_content/widgets/post_poll_creator/utils/common.dart';

class GameEndDateEditor extends StatelessWidget {
  final formatter = DateFormat.yMd().add_Hm();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostInputBloc, PostInputState>(
      builder: (context, state) {
        return Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () => _showDatePicker(context, state),
            child: Container(
              decoration: getInputOutline(context),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      PostsLocalizations.of(context)
                          .translate(Messages.pollEndDateText),
                      style: Theme.of(context).inputDecorationTheme.hintStyle,
                    ),
                  ),
                  Text(formatter.format(state.game.endDateTime)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showDatePicker(BuildContext context, PostInputState state) async {
    final currentDate = state.game.endDateTime;

    // Ask for a date
    final date = await showDatePicker(
      context: context,
      useRootNavigator: false,
      firstDate: DateTime(1900),
      initialDate: currentDate ?? DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      // Ask for a time
      final time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(currentDate ?? DateTime.now()));
      // Update the date
      final newDate = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
      BlocProvider.of<PostInputBloc>(context).add(ChangeGameDate(newDate));
    }
  }
}
