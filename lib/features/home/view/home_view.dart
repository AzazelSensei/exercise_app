import 'package:exercise_app/core/extension/double_extension.dart';
import 'package:exercise_app/core/extension/ui_extension.dart';
import 'package:exercise_app/core/utils/emoji_block.dart';
import 'package:exercise_app/features/home/widget/custom_listtile_widget.dart';
import 'package:exercise_app/features/home/widget/excercise_icon_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/common/common_libs.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../view_model/exercise_bloc.dart';
import '../widget/filter_dialog.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

final TextEditingController _seacrhController = TextEditingController();

class _HomeViewState extends State<HomeView> {
  void getExercise() => context.read<ExerciseBloc>().add(GetExercise(
        name: _seacrhController.text,
      ));

  @override
  void initState() {
    super.initState();
    getExercise();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xFFE5E5E5),
        body: _body(),
      ),
    );
  }

  BlocBuilder<ExerciseBloc, ExerciseState> _body() {
    return BlocBuilder<ExerciseBloc, ExerciseState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.light,
              ),
              expandedHeight: 130,
              pinned: true,
              backgroundColor: Colors.deepPurple,
              flexibleSpace: FlexibleSpaceBar(
                title: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        searchTextField(),
                        IconButton(
                          icon: const Icon(
                            Icons.sort,
                            color: Colors.white,
                          ),
                          onPressed: () => showFilterDialog(context, () {
                            getExercise();
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
                centerTitle: true,
              ),
            ),
            if (state.status == ExerciseStatus.loading)
              const SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            else if (state.status == ExerciseStatus.loaded)
              _sliverList(state),
          ],
        );
      },
    );
  }

  Expanded searchTextField() {
    return Expanded(
                        child: SizedBox(
                          height: 40,
                          child: CustomTextField(
                            controller: _seacrhController,
                            hintText: 'Search',
                            onChanged: (_) => getExercise(),
                            icon: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(
                                Icons.search,
                                color: Colors.black54,
                              ),
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(
                                  RegExp(emojiDeny)),
                            ],
                          ),
                        ),
                      );
  }

  SliverList _sliverList(ExerciseState state) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            padding: context.lowPadding,
            margin: context.lowPadding,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: CustomListTile(
              leading: Column(
                children: [
                  ExcerciseIcon(name: state.exercises[index].type.toString()),
                  0.07.space,
                  Chip(
                    label: SizedBox(
                      width: 90,
                      child: Text(
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        softWrap: false,
                        state.exercises[index].type?.toUpperCase() ?? "",
                      ),
                    ),
                  ),
                  Chip(
                    backgroundColor: state.exercises[index].difficulty
                                ?.toUpperCase() ==
                            "BEGINNER"
                        ? Colors.green
                        : state.exercises[index].difficulty == "intermediate"
                            ? Colors.orange
                            : Colors.red,
                    label: SizedBox(
                      width: 100,
                      child: Text(
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        softWrap: false,
                        state.exercises[index].difficulty?.toUpperCase() ?? "",
                      ),
                    ),
                  ),
                ],
              ),
              title: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        state.exercises[index].name?.toUpperCase() ?? "",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              content: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Chip(
                        label: Text(
                            state.exercises[index].equipment!.toUpperCase()),
                      ),
                      Chip(
                        label: Text(
                          state.exercises[index].muscle!.toUpperCase(),
                        ),
                      ),
                    ],
                  ),
                  Text(state.exercises[index].instructions ?? ""),
                ],
              ),
            ),
          );
        },
        childCount: state.exercises.length,
      ),
    );
  }
}
