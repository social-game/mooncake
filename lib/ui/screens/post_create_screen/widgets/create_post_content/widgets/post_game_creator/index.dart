import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mooncake/ui/screens/post_create_screen/widgets/create_post_content/widgets/post_game_creator/widgets/game_end_date_editor/index.dart';
import 'package:mooncake/ui/screens/post_create_screen/widgets/create_post_content/widgets/post_game_creator/widgets/game_option_editor/index.dart';

import '../../../../blocs/export.dart';

class PostGameCreator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostInputBloc, PostInputState>(
      builder: (context, state) {
        final optionsLength = state.game?.options?.length ?? 0;
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GameOptionEditor(
                    option: state.game.options[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 8,
                  );
                },
                itemCount: optionsLength),
            SizedBox(height: optionsLength < 5 ? 10 : 30),
            GameEndDateEditor(),
          ],
        );
      },
    );
  }
}
