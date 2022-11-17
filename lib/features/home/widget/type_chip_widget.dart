import '../../../core/common/common_libs.dart';
import '../constant/exercise_type_enum.dart';
import '../view_model/exercise_bloc.dart';

class TypeChipWidget extends StatelessWidget {
  const TypeChipWidget({
    Key? key,
    required ExerciseBloc exerciseBloc,
    required this.state,
  })  : _exerciseBloc = exerciseBloc,
        super(key: key);

  final ExerciseBloc _exerciseBloc;
  final ExerciseState state;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        ExerciseType.values.length,
        (index) => GestureDetector(
          onTap: () {
            _exerciseBloc.add(ChangeFilter(
              type: ExerciseType.values[index],
              muscle: state.exerciseMuscle,
            ));
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Chip(
              labelStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              backgroundColor: state.exerciseType == ExerciseType.values[index]
                  ? Colors.deepPurple
                  : Colors.black12,
              label: Text(
                ExerciseType.values[index].name.toUpperCase(),
                style: TextStyle(
                    color: state.exerciseType == ExerciseType.values[index]
                        ? Colors.white
                        : Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
