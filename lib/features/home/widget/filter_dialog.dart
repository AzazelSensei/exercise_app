import 'package:exercise_app/core/extension/string_extension.dart';
import 'package:exercise_app/core/widgets/custom_button.dart';
import 'package:exercise_app/features/home/view_model/exercise_bloc.dart';
import 'package:exercise_app/core/extension/double_extension.dart';
import 'package:exercise_app/features/home/widget/type_chip_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/common/common_libs.dart';
import 'muscle_chip_widget.dart';

void showFilterDialog(BuildContext context, Function() onClose) => showDialog(
      context: context,
      builder: (_) => const _FilterDialogBody(),
    ).then((value) => onClose());

class _FilterDialogBody extends StatefulWidget {
  const _FilterDialogBody();

  @override
  State<_FilterDialogBody> createState() => _FfiltreDiaerDialogBody();
}

class _FfiltreDiaerDialogBody extends State<_FilterDialogBody> {
  late final ExerciseBloc _exerciseBloc;

  @override
  void initState() {
    super.initState();
    _exerciseBloc = context.read<ExerciseBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: BlocBuilder<ExerciseBloc, ExerciseState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              0.07.space,
              'Exercise Type'.text.clone(Colors.black, FontWeight.bold, 20),
              0.05.space,
              TypeChipWidget(
                exerciseBloc: _exerciseBloc,
                state: state,
              ),
              0.07.space,
              'Muscle Type'.text.clone(Colors.black, FontWeight.bold, 20),
              0.05.space,
              MuscleChipWidget(
                exerciseBloc: _exerciseBloc,
                state: state,
              ),
              0.07.space,
              CustomButton(
                  color: Colors.deepPurple[400],
                  fullWidthButton: true,
                  onPressed: () => Navigator.pop(context),
                  text: "Okay"),
              0.05.space,
              CustomButton(
                  color: Colors.deepPurple,
                  fullWidthButton: true,
                  onPressed: () => _exerciseBloc.add(ChangeFilter()),
                  text: "Clear All Filter"),
              0.05.space,
            ],
          );
        },
      ),
    );
  }
}
